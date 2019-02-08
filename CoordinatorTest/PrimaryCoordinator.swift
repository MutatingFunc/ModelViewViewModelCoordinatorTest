//
//  PrimaryCoordinator.swift
//  CoordinatorTest
//
//  Created by Froggatt, James on 31/01/2019.
//  Copyright © 2019 Froggatt, James. All rights reserved.
//

import UIKit

import Additions
import Coordinator

class PrimaryCoordinator: NavigationCoordinator<MasterViewModel> {
    override func start(with completion: @escaping () -> Void) {
        
        let vm = MasterViewModel(objects: [], parentCoordinator: self)
        let vc = rootViewController.storyboard!.instantiateViewController(MasterViewController.self)!
        vc.title = "Primary"
        vc.viewModel = vm
        root(vc)
        
        super.start(with: completion)
    }
    
}
