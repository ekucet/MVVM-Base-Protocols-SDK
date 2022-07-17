//
//  NSObject+.swift
//  
//
//  Created by Erkam Kucet on 17.07.2022.
//

import Foundation

public extension NSObject {
    /// * return className as String
    @objc class var className: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}
