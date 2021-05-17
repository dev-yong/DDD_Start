//
//  CalculateDiscountService.swift
//  DDD_Start
//
//  Created by 이광용 on 2021/05/17.
//

import Foundation
import Domain

public class CalculateDiscountService {
    
    private let ruleDiscounter: RuleDiscounter
    private let customerRepository: CustomerRepository
    
    public init(
        ruleDiscounter: RuleDiscounter,
        customerRepository: CustomerRepository
    ) {
        self.ruleDiscounter = ruleDiscounter
        self.customerRepository = customerRepository
    }
    
    public func calculateDiscount(
        orderLines: [OrderLine],
        customerID: String
    ) -> Money {
        let customer = self.customerRepository.customer(id: customerID)
        return self.ruleDiscounter.applyRules(customer: customer, orderLines: orderLines)
    }
    
}
