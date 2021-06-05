//
//  Account.swift
//  Domain
//
//  Created by 이광용 on 2021/06/05.
//

import Foundation

public struct Account: Store {
    
    public let id: String = UUID().uuidString
    public let isBlocked: Bool = false
    
}
