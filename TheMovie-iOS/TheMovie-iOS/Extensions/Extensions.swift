//
//  Extensions.swift
//  TheMovie-iOS
//
//  Created by Diego David Rodríguez Reyna on 21/02/23.
//

import UIKit

extension UITextField {
    
    enum PaddingSide {
        case both(CGFloat)
    }
    
    func addPadding(_ padding: PaddingSide) {
        
        self.leftViewMode = .always
        self.layer.masksToBounds = true
        
        switch padding {
        case .both(let spacing):
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: spacing, height: self.frame.height))
            self.leftView = paddingView
            self.leftViewMode = .always
            self.rightView = paddingView
            self.leftViewMode = .always
        }
    }
}

extension UIImage {
    convenience init?(url: URL?) {
        guard let url = url else { return nil }
        
        do {
            self.init(data: try Data(contentsOf: url))
        } catch {
            print("Cannot load image from url: \(url) with error \(error)")
            return nil
        }
    }
}

extension UIView {
    
    func showLoader() {
        let loader: BlurLoader = BlurLoader(frame: self.frame)
        self.addSubview(loader)
    }
    
    func removeLoader() {
        if let loader: UIView = self.subviews.first(where: { $0 is BlurLoader }) {
            loader.removeFromSuperview()
        }
    }
}
