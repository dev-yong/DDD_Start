//
//  Specification.swift
//  Domain
//
//  Created by 이광용 on 2021/06/05.
//

import Foundation

open class Specification<T> {
    
    public init() {}
    
    fileprivate var predicateHandler: ((T) -> Bool)?
    fileprivate init(
        predicateHandler: @escaping (T) -> Bool
    ) {
        self.predicateHandler = predicateHandler
    }
    
    public func predicate(argument: T) -> Bool {
        predicateHandler?(argument) ?? false
    }

}

public class SpecificationBuilder {
    
    public static func build<T>(
        where predicate: @escaping (T) -> Bool
    ) -> Specification<T> {
        return Specification<T>(predicateHandler: predicate)
    }
    
}
