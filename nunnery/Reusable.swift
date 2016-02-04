//
//  Reusable.swift
//  nunnery
//
//  Created by yh on 2/4/16.
//  Copyright © 2016 yh. All rights reserved.
//

import UIKit


public protocol Reusable: class {
    static var reuseIdentifier: String { get }
}


public protocol NibReusable: Reusable, NibLoadable {}


public extension Reusable {

    static var reuseIdentifier: String {
        return String(Self)
    }
}


public extension UITableView {
   
    func registerReusableCell<T: UITableViewCell where T: NibReusable>(cellType: T.Type) {
        self.registerNib(T.nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
  
    func registerReusableCell<T: UITableViewCell where T: Reusable>(cellType: T.Type) {
        self.registerClass(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
  
    func dequeueReusableCell<T: UITableViewCell where T: Reusable>(indexPath indexPath: NSIndexPath) -> T {
        return self.dequeueReusableCellWithIdentifier(T.reuseIdentifier, forIndexPath: indexPath) as! T
    }
    
  
    func registerReusableHeaderFooterView<T: UITableViewHeaderFooterView where T: NibReusable>(viewType: T.Type) {
        self.registerNib(T.nib, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
    }
    
 
    func registerReusableHeaderFooterView<T: UITableViewHeaderFooterView where T: Reusable>(viewType: T.Type) {
        self.registerClass(T.self, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
    }
    
    
    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView where T: Reusable>() -> T? {
        return self.dequeueReusableHeaderFooterViewWithIdentifier(T.reuseIdentifier) as! T?
    }
}

// MARK: - UICollectionView support for Reusable & NibReusable

public extension UICollectionView {
  
    func registerReusableCell<T: UICollectionViewCell where T: NibReusable>(cellType: T.Type) {
        self.registerNib(T.nib, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
  
    func registerReusableCell<T: UICollectionViewCell where T: Reusable>(cellType: T.Type) {
        self.registerClass(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
 
    func dequeueReusableCell<T: UICollectionViewCell where T: Reusable>(indexPath indexPath: NSIndexPath) -> T {
        return self.dequeueReusableCellWithReuseIdentifier(T.reuseIdentifier, forIndexPath: indexPath) as! T
    }
    
 
    func registerReusableSupplementaryView<T: UICollectionReusableView where T: NibReusable>(elementKind: String, viewType: T.Type) {
        self.registerNib(T.nib, forSupplementaryViewOfKind: elementKind, withReuseIdentifier: T.reuseIdentifier)
    }
    

    func registerReusableSupplementaryView<T: UICollectionReusableView where T: Reusable>(elementKind: String, viewType: T.Type) {
        self.registerClass(T.self, forSupplementaryViewOfKind: elementKind, withReuseIdentifier: T.reuseIdentifier)
    }
    

    func dequeueReusableSupplementaryView<T: UICollectionReusableView where T: Reusable>(elementKind: String, indexPath: NSIndexPath) -> T {
        return self.dequeueReusableSupplementaryViewOfKind(elementKind, withReuseIdentifier: T.reuseIdentifier, forIndexPath: indexPath) as! T
    }
}