#[test_only]
module interest_bps::bps_tests;

use interest_bps::bps;
use sui::test_utils::assert_eq;

const MAX_BPS: u64 = 10_000;

#[test]
fun test_max_bps() {
    assert_eq(bps::max_bps(), MAX_BPS);
}

#[random_test]
fun test_value(value: u64) {
    let value = value & MAX_BPS;
    let bps = bps::new(value);
    assert_eq(bps.value(), value);
}

#[random_test]
fun test_add(value_x: u64) {
    let value_x = value_x & MAX_BPS;
    let value_y = MAX_BPS - value_x;

    let bps_x = bps::new(value_x);
    let bps_y = bps::new(value_y);
    assert_eq(bps_x.add(bps_y).value(), value_x + value_y);
}

#[random_test]
fun test_sub(value_x: u64, value_y: u64) {
    let value_x = value_x & MAX_BPS;
    let value_y = value_y & MAX_BPS;

    let x = value_x.max(value_y);
    let y = value_x.min(value_y);

    let bps_x = bps::new(x);
    let bps_y = bps::new(y);
    assert_eq(bps_x.sub(bps_y).value(), x - y);
}

#[test]
fun test_mul() {
    // Basic multiplication cases
    assert_eq(bps::new(100).mul(100).value(), MAX_BPS); // 1% * 100 = 1
    assert_eq(bps::new(50).mul(200).value(), MAX_BPS); // 0.5% * 200 = 1
    assert_eq(bps::new(25).mul(400).value(), MAX_BPS); // 0.25% * 400 = 1

    // Edge cases with max bps (10_000)
    assert_eq(bps::new(10_000).mul(1).value(), MAX_BPS); // 100% * 1 = 1
    assert_eq(bps::new(5_000).mul(2).value(), MAX_BPS); // 50% * 2 = 1

    // Small value tests
    assert_eq(bps::new(1).mul(100).value(), 100); // 1 * 100 = 100
    assert_eq(bps::new(10).mul(10).value(), 100); // 10 * 10 = 100

    // Zero cases
    assert_eq(bps::new(0).mul(100).value(), 0); // 0% * 100 = 0
    assert_eq(bps::new(100).mul(0).value(), 0); // 1% * 0 = 0

    // Common financial scenarios
    assert_eq(bps::new(125).mul(80).value(), MAX_BPS); // 1.25% * 80 = 1
    assert_eq(bps::new(250).mul(40).value(), MAX_BPS); // 2.5% * 40 = 1
    assert_eq(bps::new(500).mul(20).value(), MAX_BPS); // 5% * 20 = 1
}

#[random_test]
fun test_calculate(bps: u64) {
    let total = 1_000_000;
    let bps = bps & MAX_BPS;
    assert_eq(bps::new(bps).calculate(total), (bps * total) / MAX_BPS);
}

#[test, expected_failure(abort_code = bps::EOverflow)]
fun test_new_overflow() {
    bps::new(MAX_BPS + 1);
}

#[test, expected_failure(abort_code = bps::EOverflow)]
fun test_add_overflow() {
    let bps_x = bps::new(MAX_BPS);
    let bps_y = bps::new(1);
    bps_x.add(bps_y);
}

#[test, expected_failure(abort_code = bps::EUnderflow)]
fun test_sub_underflow() {
    let bps_x = bps::new(1);
    let bps_y = bps::new(2);
    bps_x.sub(bps_y);
}

#[test, expected_failure(abort_code = bps::EOverflow)]
fun test_mul_overflow() {
    let bps_x = bps::new(5_001);
    bps_x.mul(2);
}