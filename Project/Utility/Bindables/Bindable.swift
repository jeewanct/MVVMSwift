//
//  Bindable.swift
//  Project
//
//  Created by jeevan tiwari on 7/15/21.
//

import Foundation

class Bindable<T> {
    typealias Listener = (T) -> Void
    var listener:Listener?
    var value: T{
        didSet{
            listener?(value)
        }
    }
    init(_ value:T){
        self.value = value
    }
    func bind( listener: @escaping Listener){
        self.listener = listener
    }
}
