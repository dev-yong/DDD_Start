//
//  Product.swift
//  DDD_Start
//
//  Created by 이광용 on 2021/05/16.
//

import Foundation

public struct Product: Hashable, Identifiable {
    
    public let id: String
    public let name: String
    public let price: Money
    public let detail: String
    public let accountID: Account.ID
    public let categoryIDs: Set<Category.ID>
    
    public init(
        id: Product.ID,
        name: String,
        price: Money,
        detail: String,
        accountID: Account.ID,
        categoryIDs: Set<Category.ID>
    ) {
        self.id = id
        self.name = name
        self.price = price
        self.detail = detail
        self.accountID = accountID
        self.categoryIDs = categoryIDs
    }
    
}
