//
//  Order.swift
//  DDD_Start
//
//  Created by 이광용 on 2021/05/16.
//

import Foundation

struct Order {

    private var state: OrderState
    private var shippingInfo: ShippingInfo?
    
    mutating func change(
        shippingInfo: ShippingInfo
    ) throws {
        guard self.state.isShippingChangeable() else {
            throw OrderError.cannotChangeShippingIn(
                state: self.state
            )
        }
        self.shippingInfo = shippingInfo
    }
    
    private mutating func changeShipped() {
        self.state = .shipped
    }
    
}

enum OrderError: LocalizedError {
    
    case cannotChangeShippingIn(state: OrderState)

}
