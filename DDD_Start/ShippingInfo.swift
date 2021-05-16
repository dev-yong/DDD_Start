//
//  ShippingInfo.swift
//  DDD_Start
//
//  Created by 이광용 on 2021/05/17.
//

import Foundation

struct ShippingInfo {
    
    let receiver: Receiver
    let address: Address
    
}

/// '받는 사람' 이라는 도메인 개념을 표현한다.
struct Receiver {
    
    let name: String
    let phoneNumber: String
    
}

/// '주소' 라는 도메인 개념을 표현한다.
struct Address {
    
    let address1: String
    let address2: String
    let zipcode: String
    
}
