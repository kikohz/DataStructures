//
//  Stack.swift
//  DataStructures
//
//  Created by x on 2018/7/31.
//  Copyright © 2018年 x. All rights reserved.
//

import Foundation
public struct Stack<T> {
    //array
    fileprivate var stackArray = [T]()
    //count
    public var count: Int {
        return stackArray.count
    }
    //is empty
    public var isEmpty: Bool {
        return stackArray.isEmpty
    }
    
    //top element
    public var top: T? {
        if isEmpty {
            return nil
        }
        else {
            return stackArray.last
        }
    }
    //push operation
    public mutating func push(_ element: T) {
        stackArray.append(element)
    }
    //pop operation
    public mutating func pop() -> T? {
        if isEmpty {
            print("stack is empty")
            return nil
        }
        else {
            return stackArray.removeLast()
        }
    }
    //print all
    public mutating func printAllElements() {
        guard count > 0 else {
            print("stack is empty")
            return
        }
        print("\nprint all stack elemets")
        for (index,value) in stackArray.enumerated() {
            print("[\(index)]]\(value)")
        }
    }
    
    
}
