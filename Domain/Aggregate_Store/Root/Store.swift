//
//  Store.swift
//  Domain
//
//  Created by 이광용 on 2021/06/05.
//

import Foundation

public protocol Store: Identifiable where ID == String {

    var id: String { get }
    var isBlocked: Bool { get }
    
}
