//
//  CustomerRepository.swift
//  DDD_Start
//
//  Created by 이광용 on 2021/05/17.
//

import Foundation

public protocol CustomerRepository {
    
    func customer(id: String) -> Customer
}
