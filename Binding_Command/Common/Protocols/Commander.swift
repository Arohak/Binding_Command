//
//  Commander.swift
//  objc_associatedObject_test
//
//  Created by Ara Hakobyan on 6/25/19.
//  Copyright © 2019 Ara Hakobyan. All rights reserved.
//

protocol Commander {
    associatedtype CommandType
    func setCommand(_ command: Command)
}
