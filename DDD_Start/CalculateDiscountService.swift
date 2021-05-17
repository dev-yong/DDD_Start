//
//  File.swift
//  DDD_Start
//
//  Created by 이광용 on 2021/05/17.
//

import Foundation

class CalculateDiscountService {
    
    private let ruleDiscounter: RuleDiscounter
    private let customerRepository: CustomerRepository
    
    init(
        ruleDiscounter: RuleDiscounter,
        customerRepository: CustomerRepository
    ) {
        self.ruleDiscounter = ruleDiscounter
        self.customerRepository = customerRepository
    }
    
    func calculateDiscount(
        orderLines: [OrderLine],
        customerID: String
    ) -> Money {
        let customer = self.customerRepository.customer(id: customerID)
        return self.ruleDiscounter.applyRules(customer: customer, orderLines: orderLines)
    }
    
}
