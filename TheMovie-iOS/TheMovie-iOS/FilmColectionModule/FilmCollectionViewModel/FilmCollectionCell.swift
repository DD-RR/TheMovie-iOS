//
//  FilmCollectionCell.swift
//  TheMovie-iOS
//
//  Created by Diego David Rodríguez Reyna on 21/02/23.
//

import UIKit

final class FilmCollectionCell: UICollectionViewCell {
    // MARK: - Properties
    static let reuseIdentifier: String = String(describing: FilmCollectionCell.self)
    @UsesLayout private var poster: UIImageView = UIImageView()
    
    // MARK: - INITIALIZER
    override init(frame: CGRect) {
       super.init(frame: frame)
       setupView()
       
    }
    
    required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
    }
    
    func setup(with viewModel: FilmList) {
       poster.image = viewModel.poster
    }
    
    // MARK: - Private Methods
    
    private func setupView() {
       contentView.addSubview(poster)
       NSLayoutConstraint.activate([
          poster.topAnchor.constraint(equalTo: contentView.topAnchor),
          poster.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
          poster.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
          poster.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 4),
          poster.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/3),
          poster.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.45)
       ])
       poster.image = UIImage(named: "menus")
    }
}
