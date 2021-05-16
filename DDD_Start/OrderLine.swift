//
//  OrderLine.swift
//  DDD_Start
//
//  Created by 이광용 on 2021/05/16.
//

import Foundation

struct OrderLine {
    
    let price: Money
    let quantity: Int
    
    func amounts() -> Money {
        
        Money()
    }
    
}
