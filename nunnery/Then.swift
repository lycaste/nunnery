//
//  then.swift
//  nunnery
//
//  Created by yh on 2/4/16.
//  Copyright © 2016 yh. All rights reserved.
//

import Foundation

public protocol Then {}

extension Then {
    func then(@noescape closure:Self->Void)->Self {
        closure(self)
        return self
    }
}

extension NSObject:Then{}