import Foundation

/// A senior-hire cost profile: monthly base salary plus the standard
/// fully-loaded multipliers (benefits, payroll taxes, bonus, retirement
/// match) and the one-time upfront cost of making the hire.
public struct HireProfile {
    public var baseMonthlySalary: Double
    public var benefitsRate: Double
    public var payrollTaxRate: Double
    public var bonusRate: Double
    public var retirementMatchRate: Double
    public var upfrontHiringCost: Double

    public init(baseMonthlySalary: Double,
                benefitsRate: Double,
                payrollTaxRate: Double,
                bonusRate: Double,
                retirementMatchRate: Double,
                upfrontHiringCost: Double) {
        self.baseMonthlySalary = baseMonthlySalary
        self.benefitsRate = benefitsRate
        self.payrollTaxRate = payrollTaxRate
        self.bonusRate = bonusRate
        self.retirementMatchRate = retirementMatchRate
        self.upfrontHiringCost = upfrontHiringCost
    }

    /// Fully loaded monthly cost of the hire.
    public var fullyLoadedMonthlyCost: Double {
        baseMonthlySalary
            * (1 + benefitsRate + payrollTaxRate + bonusRate + retirementMatchRate)
    }

    /// Amortized monthly cost of the one-time hiring spend over year one.
    public var amortizedUpfrontMonthly: Double {
        upfrontHiringCost / 12
    }
}

/// The result of comparing a flat-rate subscription to a senior hire.
public struct ComparisonResult {
    public let subscriptionMonthlyFee: Double
    public let hire: HireProfile

    public var annualSubscription: Double { subscriptionMonthlyFee * 12 }
    public var monthlyHire: Double { hire.fullyLoadedMonthlyCost + hire.amortizedUpfrontMonthly }
    public var annualHire: Double { monthlyHire * 12 }

    /// Monthly saving (positive) or loss (negative) of the subscription lane.
    public var monthlySaving: Double { monthlyHire - subscriptionMonthlyFee }
    public var annualSaving: Double { annualHire - annualSubscription }

    /// Subscription-requests per month at which per-request costs equalize
    /// for a hire delivering `hireRequestsPerMonth` requests.
    public func breakEvenRequests(hireRequestsPerMonth: Double) -> Double {
        guard hireRequestsPerMonth > 0 else { return 0 }
        return hireRequestsPerMonth * subscriptionMonthlyFee / monthlyHire
    }

    /// Effective cost per delivered request on each lane.
    public func perRequestCosts(hireRequestsPerMonth: Double,
                                subscriptionRequestsPerMonth: Double) -> (hire: Double, subscription: Double) {
        let hirePer = hireRequestsPerMonth > 0 ? monthlyHire / hireRequestsPerMonth : .infinity
        let subPer = subscriptionRequestsPerMonth > 0 ? subscriptionMonthlyFee / subscriptionRequestsPerMonth : .infinity
        return (hirePer, subPer)
    }
}

public enum FlatrateMath {
    /// Compare a flat-rate subscription against a fully loaded senior hire.
    public static func compare(subscriptionMonthlyFee: Double,
                               hire: HireProfile) -> ComparisonResult {
        ComparisonResult(subscriptionMonthlyFee: subscriptionMonthlyFee, hire: hire)
    }
}
