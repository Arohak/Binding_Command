//
//  UILabel+Ext.swift
//  objc_associatedObject_test
//
//  Created by Ara Hakobyan on 6/25/19.
//  Copyright © 2019 Ara Hakobyan. All rights reserved.
//

import UIKit

extension UILabel: BindableObject {
    typealias DefaulPropertyType = String?

    private struct AssociatedKeys {
        static var modifier = "modifier"
        static var notifier = "notifier"
    }
    
    var defaulProperty: PropertyModifier<DefaulPropertyType> {
        return textModifier
    }
    
    var textModifier: PropertyModifier<String?> {
        if let pm = objc_getAssociatedObject(self, &AssociatedKeys.modifier) as? PropertyModifier<String?> {
            return pm
        } else {
            let pm = PropertyModifier<String?> { [weak self] value in
                self?.text = value
            }
            objc_setAssociatedObject(self, &AssociatedKeys.modifier, pm, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            return pm
        }
    }
    
    //    var notifier: Notifier? {
    //        get {
    //            return objc_getAssociatedObject(self, &AssociatedKeys.notifier) as? Notifier
    //        }
    //        set {
    //            if let value = newValue {
    //                objc_setAssociatedObject(self, &AssociatedKeys.notifier, value, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    //            }
    //        }
    //    }
}
