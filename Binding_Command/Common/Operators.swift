//
//  Operators.swift
//  objc_associatedObject_test
//
//  Created by Ara Hakobyan on 6/25/19.
//  Copyright © 2019 Ara Hakobyan. All rights reserved.
//

infix operator >>
infix operator >>>
infix operator ->>
infix operator ->>>
infix operator ~>>
infix operator ~>>>
infix operator |>|

// Simpla
func >> <T>(left: Box<T>, right: @escaping (T) -> Void) {
    return left.addListener(listener: right)
}
func >>> <T>(left: Box<T>, right: @escaping (T) -> Void) {
    left.bind(listener: right)
}

// Base
func ->> <T>(left: Box<T>, right: PropertyModifier<T>) {
    left.addListener(listener: right.modifier)
}
func ->>> <T>(left: Box<T>, right: PropertyModifier<T>) {
    left.bind(listener: right.modifier)
}

// Advanced
func ~>> <T, B: Bindable>(left: Box<T>, right: B) where B.PropertyType == T {
    left.addListener(listener: right.property.modifier)
}
func ~>>> <T, B: Bindable>(left: Box<T>, right: B) where B.PropertyType == T {
    left.bind(listener: right.property.modifier)
}

// Command
func |>| <T: Commander>(left: T, right: Command) {
    left.setCommand(right)
}
