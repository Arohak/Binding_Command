//
//  Command.swift
//  objc_associatedObject_test
//
//  Created by Ara Hakobyan on 6/25/19.
//  Copyright © 2019 Ara Hakobyan. All rights reserved.
//

final class Command {
    typealias CommandType = (_ sender: AnyObject?) -> ()
    
    private let command: CommandType
    
    init(_ command: @escaping CommandType) {
        self.command = command
    }
    
    func execute(_ sender: AnyObject?) {
        command(sender)
    }
}
