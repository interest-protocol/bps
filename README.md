# Interest BPS

## It provides Basis Point arithmetic operations.

### It supports the following operations:

- `new`: Create a new BPS value.
- `add`: Add two BPS values.
- `sub`: Subtract two BPS values.
- `mul`: Multiply a BPS value by a scalar.
- `calculate`: Calculate the value of a BPS percentage of a total.
- `max_bps`: It returns the maximum BPS value.
- `value`: It returns the value of the BPS.

### Error codes

- `EOverflow`: It is raised when the BPS value is greater than the maximum BPS value (10,000).
- `EUnderflow`: It is raised when you try to subtract a BPS value from a smaller BPS value.

## Immutable

[The package is immutable](https://suiscan.xyz/mainnet/tx/6hpuLjvxC83G9zNQMnhm7WumHsynoD3HgUXDBA93u1dN)

## Mainnet Code

[Explorer](https://suiscan.xyz/mainnet/object/0x2468e935dcb65d6ab285f6c838a692f2d434b0cc1ccd2c01de2ba8e12c370df9/contracts)
