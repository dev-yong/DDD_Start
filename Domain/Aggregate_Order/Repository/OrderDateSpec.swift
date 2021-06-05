//
//  OrderDateSpec.swift
//  Infrastructure
//
//  Created by 이광용 on 2021/06/05.
//

import Foundation
import Infrastructure

public class OrderDateSpec: Specification<Order> {
    
    private let fromDate: Date
    private let toDate: Date
    
    public init(
        fromDate: Date,
        toDate: Date
    ) {
        self.fromDate = fromDate
        self.toDate = toDate
    }
    
    public override func isSatisfied(byArgument argument: Order) -> Bool {
        return self.fromDate...self.toDate ~= argument.createdDate
    }
    
}
