//
//  MasterViewModel.swift
//  CoordinatorTest
//
//  Copyright © 2019 Froggatt, James. All rights reserved.
// 

import Foundation

import Coordinator

protocol MasterViewModelProtocol {
    func addObjectAtStart()
    func objectCount() -> Int
    func title(atIndex index: Int) -> String?
    func removeObject(atIndex index: Int)
    
    func selectItem(atIndex index: Int)
}

class MasterViewModel: ViewModel {
    var objects: [Date] = []
    init(objects: [Date] = [], parentCoordinator: Coordinating?) {
        self.objects = objects
        super.init(parentCoordinator: parentCoordinator)
    }
}

extension MasterViewModel: MasterViewModelProtocol {
    func addObjectAtStart() {
        objects.insert(Date(), at: 0)
    }
    
    func objectCount() -> Int {
        return objects.count
    }
    
    func title(atIndex index: Int) -> String? {
        guard objects.indices.contains(index) else {
            return nil
        }
        return objects[index].description
    }
    
    func removeObject(atIndex index: Int) {
        objects.remove(at: index)
    }
    
    func selectItem(atIndex index: Int) {
        let object = objects[index]
        coordinatingResponder?.showDetail(object)
    }
}
