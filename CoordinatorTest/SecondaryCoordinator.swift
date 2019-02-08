//
//  SecondaryCoordinator.swift
//  CoordinatorTest
//
//  Created by Froggatt, James on 31/01/2019.
//  Copyright © 2019 Froggatt, James. All rights reserved.
//

import UIKit

import Additions
import Coordinator

class SecondaryCoordinator: NavigationCoordinator {
    let object: Date?
    
    var detailViewController: DetailViewController? {
        return rootViewController.viewControllers.first as? DetailViewController
    }
    
    init(rootViewController: UINavigationController?, object: Date?) {
        self.object = object
        super.init(rootViewController: rootViewController)
    }
    
    override func start(with completion: @escaping () -> Void) {
        let vc = rootViewController.storyboard!.instantiateViewController(DetailViewController.self)!
        vc.title = "Secondary"
        root(vc)
        setupDetailViewController()
        
        super.start(with: completion)
    }
    
    private func setupDetailViewController() {
        self.detailViewController?.setup(detailText: object?.description)
    }
}
