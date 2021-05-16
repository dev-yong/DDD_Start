//
//  Order.swift
//  DDD_Start
//
//  Created by 이광용 on 2021/05/16.
//

import Foundation

struct Order {

    private var state: OrderState
    private var shippingInfo: ShippingInfo?
    
    /// 배송지 정보 변경하기
    mutating func change(
        shippingInfo: ShippingInfo
    ) throws {
        guard self.isShippingChangeable() else {
            throw OrderError.cannotChangeShippingIn(
                state: self.state
            )
        }
        self.shippingInfo = shippingInfo
    }
    
    /// 출고 전에는 배송지를 변경할 수 없다.
    private func isShippingChangeable() -> Bool {
        self.state == .paymentWaiting || self.state == .preparing
    }
    
    /// 출고 상태로 변경하기
    public mutating func changeShipped() {
        self.state = .shipped
    }
    
    /// 주문 취소하기
    public func cancel() {
        
    }

    /// 결제 완료로 변경하기
    public func completePayment() {
        
    }
    
    private(set) var orderLines: [OrderLine] = []
    private(set) var totalAmount: Money = 0
    
    private mutating func set(
        orderLines: [OrderLine]
    ) throws {
        try self.verifyAtLeastOneOrMore(orderLines: orderLines)
        self.orderLines = orderLines
        self.calculateTotalAmounts()
    }
    
    /// 한 상품을 한개 이상 주문할 수 있다.
    private func verifyAtLeastOneOrMore(
        orderLines: [OrderLine]
    ) throws {
        
        guard !orderLines.isEmpty else {
            throw OrderError.noOrderLine
        }
    }
    
    /// 총 주문 금액은 각 상품의 구매 가격 합을 모두 더한 금액이다.
    private mutating func calculateTotalAmounts() {
        self.totalAmount = self.orderLines.reduce(0, { $0 + $1.amounts })
    }
    
}

enum OrderError: LocalizedError {
    
    case cannotChangeShippingIn(state: OrderState)
    case noOrderLine
}
