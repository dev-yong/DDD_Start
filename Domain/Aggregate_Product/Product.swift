//
//  Product.swift
//  DDD_Start
//
//  Created by 이광용 on 2021/05/16.
//

import Foundation

public struct Product {
    
    public let name: String
    public let price: Money
    public let detail: String
    
    public init(name: String, price: Money, detail: String) {
        self.name = name
        self.price = price
        self.detail = detail
    }
    
}
