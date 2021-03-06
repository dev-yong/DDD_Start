//
//  Order.swift
//  DDD_Start
//
//  Created by 이광용 on 2021/05/16.
//

import Foundation

public typealias OrderNumber = String

/// 고유 식별자를 갖는 객체로 자신의 라이프사이클을 갖기 때문에,  Entity이다.
public struct Order: Identifiable {
    
    /// 주문할 때 배송지 정보를 반드시 지정해야 한다.
    public init(
        orderer: Orderer,
        orderLines: [OrderLine] = [],
        shippingInfo: ShippingInfo,
        state: OrderState
    ) throws {
        self.orderer = orderer
        self.shippingInfo = shippingInfo
        self.state = state
        
        try self.verifyAtLeastOneOrMore(orderLines: orderLines)
    }
    
    /// Enity로서 식벽자를 갖는다.
    public let id: OrderNumber = UUID().uuidString
    public let orderer: Orderer
    public private(set) var state: OrderState
    public private(set) var shippingInfo: ShippingInfo
    
    /// 배송지 정보 변경하기
    /// 출고 전에는 배송지를 변경할 수 없다.
    public mutating func change(
        shippingInfo: ShippingInfo
    ) throws {
        try self.verifyNotYetShipped()
        self.shippingInfo = shippingInfo
    }
    
    private func verifyNotYetShipped() throws {
        guard !(self.state != .paymentWaiting && self.state != .preparing) else {
            throw OrderError.alreadyShipped
        }
    }
    
    /// 출고 상태로 변경하기
    public mutating func changeShipped() {
        self.state = .shipped
    }
    
    /// 주문 취소하기
    /// 출고 전에 주문을 취소할 수 있다.
    public mutating func cancel() throws {
        try self.verifyNotYetShipped()
        self.state = .cancelled
    }

    /// 결제 완료로 변경하기
    public func completePayment() {
        
    }
    
    public private(set) var orderLines: [OrderLine] = []
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
    
    public private(set) var totalAmount: Money = 0
    /// 총 주문 금액은 각 상품의 구매 가격 합을 모두 더한 금액이다.
    private mutating func calculateTotalAmounts() {
        self.totalAmount = self.orderLines.reduce(0, { $0 + $1.amounts })
    }
    
}

extension Order: Hashable {
    
    public static func == (
        lhs: Order,
        rhs: Order
    ) -> Bool {
        return lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
    
}

public enum OrderError: LocalizedError {
    
    case cannotChangeShippingIn(state: OrderState)
    case noOrderLine
    case alreadyShipped
}
