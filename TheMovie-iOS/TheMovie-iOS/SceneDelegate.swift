//
//  SceneDelegate.swift
//  TheMovie-iOS
//
//  Created by Diego David Rodríguez Reyna on 20/02/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    var coordination: MainCoordination?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: scene)
        coordination = MainCoordination(rootViewController: UINavigationController(), viewControllerFactory: CoordinationFactory())
        coordination?.start()
        
        window?.rootViewController = coordination?.rootViewController
        window?.makeKeyAndVisible()
    }
    
}
