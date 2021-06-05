//
//  ProductListService.swift
//  Application
//
//  Created by 이광용 on 2021/06/05.
//

import Foundation
import Domain

public class ProductListService {
    
    private let categoryRepository: CategoryRepository
    private let productRepository: ProductRepository
    
    public init(
        categoryRepository: CategoryRepository,
        productRepository: ProductRepository
    ) {
        self.categoryRepository = categoryRepository
        self.productRepository = productRepository
    }
    
    public func product(
        byCategoryID categoryID: String,
        page: Int,
        size: Int
    ) -> Page<Product> {
        let category = self.categoryRepository.category(id: categoryID)
        
        let products = self.productRepository.products(
            byCategoryID: category.id,
            page: page,
            size: size
        )
        let totalCount = self.productRepository.totalNumberOfProducts(
            byCateogryID: category.id
        )
        return Page<Product>(
            pageIndex: page,
            size: size,
            totalCount: totalCount,
            items: products
        )
    }
}

public struct Page<Item> {
    
    public let pageIndex: Int
    public let size: Int
    public let totalCount: Int
    public let items: [Item]
    
}
