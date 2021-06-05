//
//  AndSpec.swift
//  Infrastructure
//
//  Created by 이광용 on 2021/06/05.
//

import Foundation

public class AndSpec<T>: Specification<T> {
    
    private let specs: [Specification<T>]
    
    public init(
        specs: [Specification<T>]
    ) {
        self.specs = specs
        super.init()
    }
    
    public override func predicate(argument: T) -> Bool {
        self.specs.allSatisfy { $0.predicate(argument: argument) }
    }
    
}
