# Interest BPS

## It provides Basis Point arithmetic operations.

### It supports the following operations:

- `new`: Create a new BPS struct.
- `add`: Add two BPS structs.
- `sub`: Subtract two BPS structs.
- `mul`: Multiply a BPS struct by a scalar.
- `div`: Divide a BPS struct by a scalar.
- `calculate`: Calculate the value of a BPS percentage from a total.
- `max_bps`: It returns the maximum BPS value.
- `value`: It returns the raw value of the BPS.

### Error codes

- `EOverflow`: It is raised when the BPS value is greater than the maximum BPS value (10,000).
- `EUnderflow`: It is raised when you try to subtract a BPS value from a smaller BPS value.
- `EDivideByZero`: It is raised when you try to divide by zero.

## Immutable

[The package is immutable](https://suiscan.xyz/mainnet/tx/DQYSXsorHg8kRgFJhbvRh18uUJERSxxKFJXvQmudnGsq)

## Mainnet Code

[Explorer](https://suiscan.xyz/mainnet/object/0xfc898e25dce062bd783aba30216138106f52f72d432c2d789ebe20d153d5f1f6/contracts)

sui client call --package 0x2 --module package --gas-budget 50000000 --function make_immutable --args 0xd65c475d636fb4fb5c4c3e726a765a13f9e556ed6f12806a72752bd7a1f82ef3
