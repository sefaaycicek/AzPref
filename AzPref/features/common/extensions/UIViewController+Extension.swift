//
//  UIViewController+Extension.swift
//  AzPref
//
//  Created by Sefa Aycicek on 22.02.2024.
//

import UIKit

extension UIViewController {
    func showAlertExt(title: String, message: String, actions : ((_ alertController : UIAlertController)->())? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        if let actions = actions {
            actions(alertController)
        }
        
        present(alertController, animated: true)
    }
}


extension UIViewController {
    func showProgress() { }
    func hideProgress() { }
}
