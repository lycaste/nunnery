//
//  NibLoadable.swift
//  nunnery
//
//  Created by yh on 2/4/16.
//  Copyright © 2016 yh. All rights reserved.
//

import UIKit

public protocol NibLoadable: class {
    /// The nib file to use to load a new instance of the View designed in a XIB
    static var nib: UINib { get }
}

// MARK: - Default implementation form NibLoadable

public extension NibLoadable {
 
    static var nib: UINib {
        return UINib(nibName: String(Self), bundle: nil)
    }
}

// MARK: - Support for instantiation from nib

public extension NibLoadable where Self: UIView {
  
    static func loadFromNib() -> Self {
        return nib.instantiateWithOwner(nil, options: nil).first as! Self
    }
}