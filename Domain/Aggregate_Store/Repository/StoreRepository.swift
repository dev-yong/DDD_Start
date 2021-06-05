//
//  StoreRepository.swift
//  Domain
//
//  Created by 이광용 on 2021/06/05.
//

import Foundation

public protocol StoreRepository {
    
    associatedtype Store: Domain.Store
    func store(id: Store.ID) -> Store
    
}
