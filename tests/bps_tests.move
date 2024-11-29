#[test_only]
module interest_bps::bps_tests;

use interest_bps::bps;
use sui::test_utils::assert_eq;

#[test]
fun test_max_bps() {
    assert_eq(bps::max_bps(), 10_000);
}

#[random_test]
fun test_value(value: u8) {
    let value = value as u64;
    let bps = bps::new(value);
    assert_eq(bps.value(), value);
}

#[random_test]
fun test_add(value_x: u8, value_y: u8) {
    let value_x = value_x as u64;
    let value_y = value_y as u64;
    let bps_x = bps::new(value_x);
    let bps_y = bps::new(value_y);
    assert_eq(bps_x.add(bps_y).value(), value_x + value_y);
}

#[random_test]
fun test_sub(value_x: u8, value_y: u8) {
    let value_x = value_x as u64;
    let value_y = value_y as u64;

    let x = value_x.max(value_y);
    let y = value_x.min(value_y);

    let bps_x = bps::new(x);
    let bps_y = bps::new(y);
    assert_eq(bps_x.sub(bps_y).value(), x - y);
}

#[test]
fun test_mul() {
    // Basic multiplication cases
    assert_eq(bps::new(100).mul(100).value(), 10_000); // 1% * 100 = 1
    assert_eq(bps::new(50).mul(200).value(), 10_000); // 0.5% * 200 = 1
    assert_eq(bps::new(25).mul(400).value(), 10_000); // 0.25% * 400 = 1

    // Edge cases with max bps (10_000)
    assert_eq(bps::new(10_000).mul(1).value(), 10_000); // 100% * 1 = 1
    assert_eq(bps::new(5_000).mul(2).value(), 10_000); // 50% * 2 = 1

    // Small value tests
    assert_eq(bps::new(1).mul(100).value(), 100); // 1 * 100 = 100
    assert_eq(bps::new(10).mul(10).value(), 100); // 10 * 10 = 100

    // Zero cases
    assert_eq(bps::new(0).mul(100).value(), 0); // 0% * 100 = 0
    assert_eq(bps::new(100).mul(0).value(), 0); // 1% * 0 = 0

    // Common financial scenarios
    assert_eq(bps::new(125).mul(80).value(), 10_000); // 1.25% * 80 = 1
    assert_eq(bps::new(250).mul(40).value(), 10_000); // 2.5% * 40 = 1
    assert_eq(bps::new(500).mul(20).value(), 10_000); // 5% * 20 = 1
}

#[random_test]
fun test_calculate(bps: u8) {
    let total = 1_000_000;
    let bps = bps as u64;
    assert_eq(bps::new(bps).calculate(total), (bps * total) / 10_000);
}

#[test, expected_failure(abort_code = bps::EOverflow)]
fun test_new_overflow() {
    bps::new(10_001);
}

#[test, expected_failure(abort_code = bps::EOverflow)]
fun test_add_overflow() {
    let bps_x = bps::new(10_000);
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
