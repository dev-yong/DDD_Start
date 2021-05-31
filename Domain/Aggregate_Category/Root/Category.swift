//
//  Category.swift
//  Domain
//
//  Created by 이광용 on 2021/05/31.
//

import Foundation

public struct Category {
    
    private var _products: Set<Product> = []
    
    func products(page: Int, size: Int) -> [Product] {
        let beginIndex = (page - 1) * size
        let endIndex = page * size
        let sortedProducts = self._products
            .sorted { $0.name < $1.name }
        return Array(sortedProducts[beginIndex..<endIndex])
    }
    
}
