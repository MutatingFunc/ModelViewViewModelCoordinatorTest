//
//  DetailViewModel.swift
//  CoordinatorTest
//
//  Copyright © 2019 Froggatt, James. All rights reserved.
// 

import Foundation

import Coordinator

class DetailViewModel: ViewModel {
    let object: Date?
    
    init(object: Date?, parentCoordinator: Coordinating?) {
        self.object = object
        super.init(parentCoordinator: parentCoordinator)
    }
    
}
