//
//  Product.swift
//  DDD_Start
//
//  Created by 이광용 on 2021/05/16.
//

import Foundation

public struct Product: Hashable, Identifiable {
    
    public let id: String = UUID().uuidString
    public let name: String
    public let price: Money
    public let detail: String
    public let categoryIDs: Set<Category.ID>
    
    public init(
        name: String,
        price: Money,
        detail: String,
        categoryIDs: Set<Category.ID>
    ) {
        self.name = name
        self.price = price
        self.detail = detail
        self.categoryIDs = categoryIDs
    }
    
}
