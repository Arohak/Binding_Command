//
//  Container.swift
//  Binding_Command
//
//  Created by Ara Hakobyan on 6/26/19.
//  Copyright © 2019 Ara Hakobyan. All rights reserved.
//

import Foundation
import UIKit

typealias Action = (AnyObject) -> ()

//MARK: - UIButton
public extension Container where Host: UIButton {
    internal func tap(_ action: @escaping Action) {
        let target = ButtonTarget(host: host, action: action)
        targets[ButtonTarget.uniqueId] = target
    }
}

class ButtonTarget: NSObject {
    static let uniqueId = "ffffff"
    var action: Action?
    
    init(host: UIButton, action: @escaping Action) {
        super.init()
        self.action = action
        host.addTarget(self, action: #selector(handleTap(_:)), for: .touchUpInside)
    }
    
    @objc func handleTap(_ sender: AnyObject) {
        action?(sender)
    }
}

//MARK: - UILabel
public extension Container where Host: UILabel {
    internal func tap(_ action: @escaping Action) {
        let target = LabelTarget(host: host, action: action)
        targets[LabelTarget.uniqueId] = target
    }
}

class LabelTarget: NSObject {
    static let uniqueId = "aaaaaa"
    var action: Action?
    
    init(host: UILabel, action: @escaping Action) {
        super.init()
        self.action = action
        host.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap(_:))))
    }
    
    @objc func handleTap(_ sender: AnyObject) {
        action?(sender)
    }
}
