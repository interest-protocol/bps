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

## Immutable

[The package is immutable](https://suiscan.xyz/mainnet/tx/64TmEHHJgn9WMYAN2zHYb3NbSrBw6sbqPai6UdTB5wAh)

## Mainnet Code

[Explorer](https://suiscan.xyz/mainnet/object/0x861a5bc378c5a4cdb8ed680c8edf6e147427f776c3b0af0002abe508c2621998/contracts)
