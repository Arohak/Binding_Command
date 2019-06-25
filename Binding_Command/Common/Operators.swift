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
func ~>> <T, B: BindableObject>(left: Box<T>, right: B) where B.DefaulPropertyType == T {
    left.addListener(listener: right.defaulProperty.modifier)
}
func ~>>> <T, B: BindableObject>(left: Box<T>, right: B) where B.DefaulPropertyType == T {
    left.bind(listener: right.defaulProperty.modifier)
}

// Command
func |>| <T, B: Commander>(left: B, right: Command) where B.CommandType == T {
    left.setCommand(right)
}
