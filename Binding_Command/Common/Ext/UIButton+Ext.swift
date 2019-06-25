//
//  UIButton+Ext.swift
//  objc_associatedObject_test
//
//  Created by Ara Hakobyan on 6/25/19.
//  Copyright © 2019 Ara Hakobyan. All rights reserved.
//

import UIKit

extension UIButton: Commander {
    typealias CommandType = ()

    private struct AssociatedKeys {
        static var command = "command"
    }
    
    func setCommand(_ command: Command) {
        if let _ = objc_getAssociatedObject(self, &AssociatedKeys.command) {
            fatalError("Multiple assigment to command")
        }
        objc_setAssociatedObject(self, &AssociatedKeys.command, command, .OBJC_ASSOCIATION_ASSIGN)
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped(sender: AnyObject?) {
        if let c = objc_getAssociatedObject(self, &AssociatedKeys.command) as? Command {
            c.execute(sender)
        }
    }
}
