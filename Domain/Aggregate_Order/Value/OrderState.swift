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
    case cancelled
    
}
