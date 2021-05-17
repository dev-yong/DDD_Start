//
//  OrderLine.swift
//  DDD_Start
//
//  Created by 이광용 on 2021/05/16.
//

import Foundation

public struct OrderLine {
    
    public let product: Product
    public let price: Money
    public let quantity: Int
    /// 각 상품의 구매 가격 합은 상품 가격에 구매 개수를 곱한 값이다.
    public var amounts: Money {
        self.calculateAmoutns()
    }
    
    public init(
        product: Product,
        price: Money,
        quantity: Int
    ) {
        self.product = product
        self.price = price
        self.quantity = quantity
    }
    
    private func calculateAmoutns() -> Int {
        
        return self.price * quantity
    }

}
