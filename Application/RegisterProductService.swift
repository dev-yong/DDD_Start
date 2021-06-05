//
//  RegisterProductService.swift
//  Application
//
//  Created by 이광용 on 2021/06/05.
//

import Foundation
import Domain

public class RegisterProductService<AccountRepository: StoreRepository> {
    
    private let accountRepository: AccountRepository
    private let productRepository: ProductRepository
    
    public init(
        accountRepository: AccountRepository,
        productRepository: ProductRepository
    ) {
        self.accountRepository = accountRepository
        self.productRepository = productRepository
    }
    
    public func register(
        productRequest: ProductRequest
    ) -> Product.ID {
        let account = self.accountRepository.store(id: productRequest.accountID)
        guard !account.isBlocked else {
            fatalError()
        }
        let productID = self.productRepository.nextID()
        let product = Product(
            id: productID,
            name: productRequest.name,
            price: productRequest.price,
            detail: productRequest.detail,
            accountID: productRequest.accountID,
            categoryIDs: productRequest.categoryIDs
        )
        self.productRepository.save(product: product)
        return productID
    }
}

public struct ProductRequest {
    
    public let name: String
    public let price: Money
    public let detail: String
    public let accountID: Account.ID
    public let categoryIDs: Set<Domain.Category.ID>
    
}

