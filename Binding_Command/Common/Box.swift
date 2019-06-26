//
//  Box.swift
//  objc_associatedObject_test
//
//  Created by Ara Hakobyan on 6/25/19.
//  Copyright © 2019 Ara Hakobyan. All rights reserved.
//
//  https://habr.com/ru/post/252535/
//  https://medium.com/flawless-app-stories/simplifying-communication-patterns-with-closure-in-swift-1938414468b3

class Box<T> {
    typealias Listener = (T) -> ()
    private var listeners: [Listener] = []
    
    var value: T {
        didSet {
            listeners.forEach { listener in listener(value) }
        }
    }
    
    init(_ v: T) {
        value = v
    }
    
    func bind(listener: @escaping Listener) {
        listeners.append(listener)
        listener(value)
    }
    
    func addListener(listener: @escaping Listener) {
        listeners.append(listener)
    }
}
