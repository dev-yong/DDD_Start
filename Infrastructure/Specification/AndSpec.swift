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
    }
    
    public override func isSatisfied(byArgument argument: T) -> Bool {
        return self.specs
            .map { $0.isSatisfied(byArgument: argument) }
            .contains(where: { !$0 }) ? false : true
    }
    
}
