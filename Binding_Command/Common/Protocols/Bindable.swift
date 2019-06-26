//
//  Bindable.swift
//  Binding_Command
//
//  Created by Ara Hakobyan on 6/26/19.
//  Copyright © 2019 Ara Hakobyan. All rights reserved.
//

protocol Bindable {
    associatedtype PropertyType
    var property: PropertyModifier<PropertyType> { get }
}
