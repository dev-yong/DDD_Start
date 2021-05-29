//
//  Orderer.swift
//  DDD_Start
//
//  Created by 이광용 on 2021/05/16.
//

import Foundation

public struct Orderer {
    
    private let member: Member
    public let name: String
    public init(
        name: String,
        member: Member
    ) {
        self.name = name
        self.member = member
    }
    
}
