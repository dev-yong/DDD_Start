//
//  Specs.swift
//  Infrastructure
//
//  Created by 이광용 on 2021/06/05.
//

import Foundation

public class Specs {
    
    public static func and<T>(_ specs: Specification<T>...) -> AndSpec<T> {
        AndSpec(specs: specs)
    }
    
    public static func or<T>(_ specs: Specification<T>...) -> OrSpec<T> {
        OrSpec(specs: specs)
    }
    
}
