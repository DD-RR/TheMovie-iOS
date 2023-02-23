//
//  ProfileViewController.swift
//  TheMovie-iOS
//
//  Created by Diego David Rodríguez Reyna on 21/02/23.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    // MARK: - Properties
    @UsesLayout private var profileCollection: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    var viewModel: ProfileViewModel?
    @UsesLayout private var userNameText: UITextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.requestProfiles()
        
    }
    
    // MARK: - Private Methods
    
    private func setupView() {
        view.backgroundColor = .black
        userAvatar()
    }
    
    private func userAvatar() {
        @UsesLayout var usuarioAvatar: UIImageView = UIImageView()
        usuarioAvatar.image = UIImage(named: "UserAvatar")
        view.addSubview(usuarioAvatar)
        NSLayoutConstraint.activate([
            usuarioAvatar.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            usuarioAvatar.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 1),
            usuarioAvatar.heightAnchor.constraint(equalToConstant: 150),
            usuarioAvatar.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupView()
        setupNavigationBar()
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
        print("Movies")
        DispatchQueue.main.async { [weak self] in
            let coordinator: Coordination = MainCoordination(rootViewController: self?.navigationController ?? UINavigationController(), viewControllerFactory: CoordinationFactory())
            coordinator.filmCollection()
        }
    }
}

extension ProfileViewController: UICollectionViewDelegate {}
