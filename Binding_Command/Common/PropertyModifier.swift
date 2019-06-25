//
//  PropertyModifier.swift
//  objc_associatedObject_test
//
//  Created by Ara Hakobyan on 6/24/19.
//  Copyright © 2019 Ara Hakobyan. All rights reserved.
//

final class PropertyModifier<T> {
    typealias Modifier = (T) -> ()
    let modifier: Modifier
    
    init(_ modifier: @escaping Modifier) {
        self.modifier = modifier
    }
}

