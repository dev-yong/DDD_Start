//
//  File.swift
//  DDD_Start
//
//  Created by 이광용 on 2021/05/17.
//

import Foundation

class CalculateDiscountService {
    
    private let ruleDiscounter: RuleDiscounter
    
    init(
        ruleDiscounter: RuleDiscounter
    ) {
        self.ruleDiscounter = ruleDiscounter
    }
    
    func calculateDiscount(
        orderLines: [OrderLine],
        customerID: String
    ) -> Money {
        let customer = self.findCustomer(id: customerID)
        return self.ruleDiscounter.applyRules(customer: customer, orderLines: orderLines)
    }
    
    private func findCustomer(id: String) -> Customer {
        Customer()
    }
}
