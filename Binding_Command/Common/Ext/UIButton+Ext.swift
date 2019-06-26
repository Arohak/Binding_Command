//
//  UIButton+Ext.swift
//  objc_associatedObject_test
//
//  Created by Ara Hakobyan on 6/25/19.
//  Copyright © 2019 Ara Hakobyan. All rights reserved.
//

import UIKit

extension UIButton: Commander {
    private struct Associated {
        static var key = "command"
    }
    
    func setCommand(_ command: Command) {
        if objc_getAssociatedObject(self, &Associated.key) != nil {
            fatalError("Multiple assigment to command")
        }
        objc_setAssociatedObject(self, &Associated.key, command, .OBJC_ASSOCIATION_ASSIGN)
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped(sender: AnyObject?) {
        if let c = objc_getAssociatedObject(self, &Associated.key) as? Command {
            c.execute(sender)
        }
    }
}
