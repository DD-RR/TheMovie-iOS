//
//  CordinationFactory.swift
//  TheMovie-iOS
//
//  Created by Diego David Rodríguez Reyna on 20/02/23.
//

import UIKit

protocol ViewControllerFactory {
    func loginViewController() -> UIViewController
    func filmCollectionViewController() -> UIViewController
    func profileViewController() -> UIViewController
}

class CoordinationFactory: ViewControllerFactory {
    
    func loginViewController() -> UIViewController {
        let loginAPI: LoginAPI = LoginAPI(session: .shared)
        let loginViewController: LoginViewController = LoginViewController()
        let viewModel: LoginViewModel = LoginViewModel(api: loginAPI)
        loginViewController.viewModel = viewModel
        return loginViewController
    }
    
    func filmCollectionViewController() -> UIViewController {
        let filmCollectionAPI: FilmCollectionAPI = FilmCollectionAPI(session: .shared)
        let filmCollectionViewController: FilmCollectionViewController = FilmCollectionViewController()
        let viewModel: FilmCollectionViewModel = FilmCollectionViewModel(api: filmCollectionAPI)
        filmCollectionViewController.viewModel = viewModel
        return filmCollectionViewController
    }
    
    func profileViewController() -> UIViewController {
        let profileAPI: ProfileAPI = ProfileAPI(session: .shared)
        let profileViewContoller: ProfileViewController = ProfileViewController()
        let viewModel: ProfileViewModel = ProfileViewModel(api: profileAPI)
        profileViewContoller.viewModel = viewModel
        return profileViewContoller
    }
}
