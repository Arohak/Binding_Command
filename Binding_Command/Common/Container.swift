//
//  Container.swift
//  Binding_Command
//
//  Created by Ara Hakobyan on 6/26/19.
//  Copyright © 2019 Ara Hakobyan. All rights reserved.
//

import Foundation

public class Container<Host: AnyObject>: NSObject {
    public unowned let host: Host
    public var targets = [String: NSObject]()

    public init(host: Host) {
        self.host = host
    }
}
