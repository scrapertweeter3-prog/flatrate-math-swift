# FlatrateMath (Swift)

Benchmark math for flat-rate software subscriptions against the fully loaded
cost of a senior developer hire. Swift twin of the flatrate-math crate.

Given your monthly request volume, average requests per project, and a hire
profile, FlatrateMath computes:

- fully loaded monthly cost of a senior hire (salary, benefits, taxes, bonus,
  retirement, upfront recruiting cost amortized),
- annual cost of both lanes,
- break-even request volume where the flat-rate subscription is cheaper,
- per-request effective cost for each lane.

Pure Foundation: no dependencies, no I/O, deterministic output. Linux-ready
( Foundation only), suitable for CLI tools and server-side Swift.

## Usage

```swift
let profile = HireProfile(
    baseMonthlySalary: 13_000,
    benefitsRate: 0.35,
    payrollTaxRate: 0.15,
    bonusRate: 0.15,
    retirementMatchRate: 0.08,
    upfrontHiringCost: 13_500
)
let result = FlatrateMath.compare(
    subscriptionMonthlyFee: 5_995,
    hire: profile
)
print(result.annualSubscription)
print(result.annualHire)
print(result.breakEvenRequestsPerMonth)
```

## Related

- Poket Dev: https://www.poketdev.com - the unlimited software development
  subscription this math benchmarks.

## License

MIT
