//
//  CancelOrderService.swift
//  DDD_Start
//
//  Created by 이광용 on 2021/05/17.
//

import Foundation

class CancelOrderService {
    
    private let orderRepository: OrderRepository
    
    init(
        orderRepository: OrderRepository
    ) {
        self.orderRepository = orderRepository
    }
    
    func cancel(
        id: OrderNumber
    ) throws {
        var order = self.orderRepository.order(id: id)
        try order.cancel()
    }
    
}
