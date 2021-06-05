//
//  Orderer.swift
//  DDD_Start
//
//  Created by 이광용 on 2021/05/16.
//

import Foundation

public struct Orderer: Identifiable {
    
    public var id: String {
        self.memberID
    }
    private let memberID: Member.ID
    public let name: String
    public init(
        name: String,
        memberID: Member.ID
    ) {
        self.name = name
        self.memberID = memberID
    }
    
}
