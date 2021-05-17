//
//  ShippingInfo.swift
//  DDD_Start
//
//  Created by 이광용 on 2021/05/17.
//

import Foundation

public struct ShippingInfo: Equatable {
    
    public let receiver: Receiver
    public let address: Address
    
    public init(receiver: Receiver, address: Address) {
        self.receiver = receiver
        self.address = address
    }
    
}

/// '받는 사람' 이라는 도메인 개념을 표현한다.
public struct Receiver: Equatable {
    
    public let name: String
    public let phoneNumber: String
    
    public init(name: String, phoneNumber: String) {
        self.name = name
        self.phoneNumber = phoneNumber
    }

}

/// '주소' 라는 도메인 개념을 표현한다.
public struct Address: Equatable {
    
    public let address1: String
    public let address2: String
    public let zipcode: String
    
    public init(address1: String, address2: String, zipcode: String) {
        self.address1 = address1
        self.address2 = address2
        self.zipcode = zipcode
    }

}
