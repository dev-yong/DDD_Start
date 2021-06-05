//
//  CategoryRepsotory.swift
//  Domain
//
//  Created by 이광용 on 2021/06/05.
//

import Foundation

public protocol CategoryRepository {
    
    func category(id: Category.ID) -> Category
    
}
