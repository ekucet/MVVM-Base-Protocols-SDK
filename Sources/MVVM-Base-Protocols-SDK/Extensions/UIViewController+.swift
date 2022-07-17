//
//  UIViewController+.swift
//  
//
//  Created by Erkam Kucet on 17.07.2022.
//

import UIKit

public extension UIViewController {
    func hideKeyboardWhenTappedEmptyAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
