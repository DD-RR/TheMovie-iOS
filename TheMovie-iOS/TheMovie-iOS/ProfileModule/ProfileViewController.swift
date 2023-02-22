//
//  ProfileViewController.swift
//  TheMovie-iOS
//
//  Created by Diego David Rodríguez Reyna on 21/02/23.
//

import UIKit

final class ProfileViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // viewModel?.requestProfiles() El error lo marca aca
    }
    
    override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
       setupView()
       setupNavigationBar()
    }
    
    private func setupView() {
       view.backgroundColor = .white
    }
    
    private func setupNavigationBar() {
       navigationController?.navigationBar.prefersLargeTitles = false

       let appearance = UINavigationBarAppearance()
       appearance.backgroundColor = .darkGray
       appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
       appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

       navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(goToMovies))
       
       
       navigationItem.setHidesBackButton(true, animated: true)
       navigationController?.navigationBar.tintColor = .lightGray
       navigationController?.navigationBar.standardAppearance = appearance
       navigationController?.navigationBar.compactAppearance = appearance
       navigationController?.navigationBar.scrollEdgeAppearance = appearance
       self.title = "Perfil"
    }
    
    @objc private func goToMovies() {
       print("Profile")
        DispatchQueue.main.async { [weak self] in
            let coordinator: Coordination = MainCoordination(rootViewController: self?.navigationController ?? UINavigationController(), viewControllerFactory: CoordinationFactory())
            coordinator.filmCollection()
        }
    }
}
