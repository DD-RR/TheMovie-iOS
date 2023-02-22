//
//  MainCordination.swift
//  TheMovie-iOS
//
//  Created by Diego David Rodríguez Reyna on 20/02/23.
//

import Foundation
import UIKit

protocol Coordination {
    var rootViewController: UINavigationController { get set }
    func start ()
    func filmCollection()
    func profile()
}

class MainCoordination: Coordination {
    var rootViewController: UINavigationController
    var viewControllerFactory: ViewControllerFactory
    
    init(rootViewController: UINavigationController, viewControllerFactory: ViewControllerFactory) {
       self.rootViewController = rootViewController
       self.viewControllerFactory = viewControllerFactory
    }
    
    func start() {
        rootViewController.pushViewController(viewControllerFactory.loginViewController(), animated: false)
    }
    
    func filmCollection() {
        rootViewController.pushViewController(viewControllerFactory.filmCollectionViewController(), animated: true)
    }
    
    func profile() {
        rootViewController.pushViewController(viewControllerFactory.profileViewController(), animated: true)
    }
}
