//
//  ProductRepository.swift
//  Domain
//
//  Created by 이광용 on 2021/06/05.
//

import Foundation

public protocol ProductRepository {
    
    func products(
        byCategoryID categoryID: Category.ID,
        page: Int,
        size: Int
    ) -> [Product]
    func totalNumberOfProducts(byCateogryID categoryID: Category.ID) -> Int
    
}
