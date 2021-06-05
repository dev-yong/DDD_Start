//
//  Specification.swift
//  Domain
//
//  Created by 이광용 on 2021/06/05.
//

import Foundation

open class Specification<T> {
    
    public init() {}
    
    open func isSatisfied(byArgument argument: T) -> Bool {
        fatalError()
    }
    
}
