# Interest BPS

## It provides Basis Point arithmetic operations.

### It supports the following operations:

- `new`: Create a new BPS struct.
- `add`: Add two BPS structs.
- `sub`: Subtract two BPS structs.
- `mul`: Multiply a BPS struct by a scalar.
- `div`: Divide a BPS struct by a scalar.
- `calc`: Calculate the value of a BPS percentage from a total.
- `max_bps`: It returns the maximum BPS value.
- `value`: It returns the raw value of the BPS.

### Error codes

- `EOverflow`: It is raised when the BPS value is greater than the maximum BPS value (10,000).
- `EUnderflow`: It is raised when you try to subtract a BPS value from a smaller BPS value.
- `EDivideByZero`: It is raised when you try to divide by zero.

## Mainnet Code

[Explorer](https://testnet.suivision.xyz/package/0x184c9f89d7a2ae4533cf04fa457b082769d227f9b8e63ec81921cb2abe0f882e?tab=Code)
