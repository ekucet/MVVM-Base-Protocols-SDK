//
//  BaseViewModelProtocol.swift
//  
//
//  Created by Erkam Kucet on 17.07.2022.
//

import Foundation
import UIKit.UIViewController

/// ViewModel classes should conform to this protocol
public protocol BaseViewModelProtocol {
    /// It is used to determine the type of view
    /// (that the classes that will conform to this protocol will interact with).
    associatedtype ViewType: BaseViewProtocol
    /// It is used to determine the type of model
    /// (that the classes that will conform to this protocol will interact with).
    associatedtype ModelType: BaseModelProtocol
    /// viewModel classes interact with own view. Property of "delegate" is used for this.
    var delegate: ViewType? { get set }
    /// viewModel classes interact with own model. Property of "model" is used for this.
    var model: ModelType { get }
}


public extension BaseViewModelProtocol where ViewType: UIViewController {
    /// It is used to creating a new page.
    /// This function should be called first on page changes.
    /// This function does:
    ///  * Initializes the view as viewController.
    ///  * Assigns to <viewModel>.delegate.
    ///  * Assigns it to the viewModel property of the relevant viewController.
    ///  * returns viewController
    mutating func startPage() -> ViewType {
        var viewController = ViewType.instantiate()
        self.delegate = viewController
        guard let self = self as? Self.ViewType.ViewModelType else {
            fatalError("\(ViewType.className) instantiate")
        }
        viewController.viewModel = self
        return viewController
    }
}
