//
//  AppCoordinator.swift
//  CoordinatorTest
//
//  Created by Froggatt, James on 31/01/2019.
//  Copyright © 2019 Froggatt, James. All rights reserved.
//

import UIKit

import Coordinator

extension UIResponder {
    @objc dynamic func showDetail(_ date: Date) {
        coordinatingResponder?.showDetail(date)
    }
}

class AppCoordinator: Coordinator<UISplitViewController, MasterViewModel> {
    
    var secondaryCoordinator: SecondaryCoordinator? {
        // Child coordinators are automatically registered with a string identifier matching the class name.
        // This identifier can be overridden to return different identifiers per instance.
        return self.childCoordinators["\(SecondaryCoordinator.self)"] as? SecondaryCoordinator
    }
    
    override func start(with completion: @escaping () -> Void) {
        let primaryVM = MasterViewModel(objects: [], parentCoordinator: self)
        let primaryVC = rootViewController.storyboard!.instantiateViewController(withIdentifier: "PrimaryNav") as! UINavigationController
        rootViewController.viewControllers.append(primaryVC)
        let primary = PrimaryCoordinator(rootViewController: primaryVC, viewModel: primaryVM)
        startChild(coordinator: primary)
        
        showDetailViewController(object: nil)
        
        super.start(with: completion)
    }
    
    override func showDetail(_ object: Date) {
        showDetailViewController(object: object)
    }
    
    private func showDetailViewController(object: Date?) {
        let secondaryVM = DetailViewModel(object: object, parentCoordinator: self)
        let secondaryVC = rootViewController.storyboard!.instantiateViewController(withIdentifier: "SecondaryNav") as! UINavigationController
        rootViewController.showDetailViewController(secondaryVC, sender: nil)
        if let secondary = self.secondaryCoordinator {
            stopChild(coordinator: secondary)
        }
        let secondary = SecondaryCoordinator(rootViewController: secondaryVC, viewModel: secondaryVM)
        startChild(coordinator: secondary)
    }
}
