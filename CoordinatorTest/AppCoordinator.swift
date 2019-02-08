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

class AppCoordinator: Coordinator<UISplitViewController> {
    
    var secondaryCoordinator: SecondaryCoordinator? {
        // Child coordinators are automatically registered with a string identifier matching the class name.
        // This identifier can be overridden to return different identifiers per instance.
        return self.childCoordinators["\(SecondaryCoordinator.self)"] as? SecondaryCoordinator
    }
    
    override func start(with completion: @escaping () -> Void) {
        let primaryVC = rootViewController.storyboard!.instantiateViewController(withIdentifier: "PrimaryNav") as! UINavigationController
        rootViewController.viewControllers.append(primaryVC)
        let primary = PrimaryCoordinator(rootViewController: primaryVC)
        startChild(coordinator: primary)
        
        showDetailViewController(object: nil)
        
        super.start(with: completion)
    }
    
    override func showDetail(_ object: Date) {
        showDetailViewController(object: object)
    }
    
    private func showDetailViewController(object: Date?) {
        let secondaryVC = rootViewController.storyboard!.instantiateViewController(withIdentifier: "SecondaryNav") as! UINavigationController
        rootViewController.showDetailViewController(secondaryVC, sender: nil)
        if let secondary = self.secondaryCoordinator {
            stopChild(coordinator: secondary)
        }
        let secondary = SecondaryCoordinator(rootViewController: secondaryVC, object: object)
        startChild(coordinator: secondary)
    }
}
