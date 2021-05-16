//
//  OrderState.swift
//  DDD_Start
//
//  Created by 이광용 on 2021/05/16.
//

import Foundation

enum OrderState {
    
    case paymentWaiting
    case preparing
    case shipped
    case delivering
    case deliveringCompleted
 
    func isShippingChangeable() -> Bool {
        switch self {
        case .paymentWaiting:
            return true
        case .preparing:
            return true
        case .shipped:
            return false
        case .delivering:
            return false
        case .deliveringCompleted:
            return false
        }
    }
    
}
