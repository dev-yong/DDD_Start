//
//  Store.swift
//  Domain
//
//  Created by 이광용 on 2021/06/05.
//

import Foundation

public protocol Store: Identifiable where ID == String {

    var id: String { get }
    var isBlocked: Bool { get }
    
}

extension Store {
    
    public func createProduct(
        productID: Product.ID,
        name: String,
        price: Money,
        detail: String,
        categoryIDs: Set<Category.ID>
    ) -> Product {
        guard !self.isBlocked else {
            fatalError()
        }
        return Product(
            id: productID,
            name: name,
            price: price,
            detail: detail,
            accountID: self.id,
            categoryIDs: categoryIDs
        )
    }
    
}
