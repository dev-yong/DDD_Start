//
//  OrderRepository.swift
//  DDD_Start
//
//  Created by 이광용 on 2021/05/17.
//

import Foundation
import Infrastructure

public protocol OrderRepository {
    
    func order(id: OrderNumber) -> Order
    func save(order: Order)
    func delete(order: Order)
    func find(spec: Specification<Order>) -> [Order]
    
}
