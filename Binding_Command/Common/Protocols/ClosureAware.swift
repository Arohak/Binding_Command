//
//  BindableObject.swift
//  objc_associatedObject_test
//
//  Created by Ara Hakobyan on 6/25/19.
//  Copyright © 2019 Ara Hakobyan. All rights reserved.
//

import Foundation

extension NSObject: ClosureAware { }

public protocol ClosureAware: class {
    associatedtype ClosureAwareHostType: AnyObject
    var on: Container<ClosureAwareHostType> { get }
}

private struct Associated {
    static var key = "EasyClosure_on"
}

extension ClosureAware {
    public var on: Container<Self> {
        get {
            if let value = objc_getAssociatedObject(self, &Associated.key) as? Container<Self> {
                return value
            }
            let value = Container(host: self)
            objc_setAssociatedObject(self, &Associated.key, value, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            return value
        }
    }
}
