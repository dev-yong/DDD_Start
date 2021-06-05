//
//  OrdererSpec.swift
//  Infrastructure
//
//  Created by 이광용 on 2021/06/05.
//

import Foundation
import Infrastructure

public class OrdererSpec: Specification<Order> {
    
    private let ordererID: Order.ID
    
    public init(
        ordererID: Orderer.ID
    ) {
        self.ordererID = ordererID
        super.init()
    }
    
    public override func isSatisfied(
        byArgument argument: Order
    ) -> Bool {
        return argument.orderer.id == self.ordererID
    }

}
