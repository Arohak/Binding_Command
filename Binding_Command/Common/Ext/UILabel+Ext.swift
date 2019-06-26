//
//  UILabel+Ext.swift
//  objc_associatedObject_test
//
//  Created by Ara Hakobyan on 6/25/19.
//  Copyright © 2019 Ara Hakobyan. All rights reserved.
//

import UIKit

extension UILabel: Bindable {
    typealias PropertyType = String?

    private struct Associated {
        static var key = "modifier"
    }
    
    var property: PropertyModifier<PropertyType> {
        return textModifier
    }

    var textModifier: PropertyModifier<String?> {
        if let pm = objc_getAssociatedObject(self, &Associated.key) as? PropertyModifier<String?> {
            return pm
        } else {
            let pm = PropertyModifier<String?> { [weak self] value in
                self?.text = value
            }
            objc_setAssociatedObject(self, &Associated.key, pm, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            return pm
        }
    }
}

//class On {
//    func tap(_ closure: () -> Void) {}
//    func tapRow(_ closure: () -> Void) {}
//    func textChange(_ closure: () -> Void) {}
//}
//
//extension NSObject {
//    private struct AssociatedKeys {
//        static var notifier = "notifier"
//    }
//    
//    var on: On? {
//        get {
//            return objc_getAssociatedObject(self, &AssociatedKeys.notifier) as? On
//        }
//        set {
//            if let value = newValue {
//                objc_setAssociatedObject(self, &AssociatedKeys.notifier, value, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
//            }
//        }
//    }
//}
