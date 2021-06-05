//
//  OrderSpecs.swift
//  Infrastructure
//
//  Created by 이광용 on 2021/06/05.
//

import Foundation
import Infrastructure

public class OrderSpecs {
    
    public static func orderer(ordererID: Orderer.ID) -> Specification<Order> {
        SpecificationBuilder.build {
            $0.orderer.id == ordererID
        }
    }
    
    public static func between(from: Date, to: Date) -> Specification<Order> {
        SpecificationBuilder.build {
            from...to ~= $0.createdDate
        }
    }
    
}
