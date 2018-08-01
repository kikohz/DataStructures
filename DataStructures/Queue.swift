//
//  Queue.swift
//  DataStructures
//
//  Created by x on 2018/8/1.
//  Copyright © 2018年 x. All rights reserved.
//

import Foundation
public struct Queue<T> {
    //array
    fileprivate var queueArray = [T]()
    //count
    public var count: Int {
        return queueArray.count
    }
    //is empty
    public var isEmpty: Bool {
        return queueArray.isEmpty
    }
    // front element
    public var front: T? {
        if isEmpty {
            print("queue is empty")
            return nil
        }
        else {
            return queueArray.first
        }
    }
    //add element
    public mutating func enqueue(_ element: T) {
        queueArray.append(element)
    }
    
    //remove element
    public mutating func dequeue() ->T? {
        if isEmpty {
            print("queue is empty")
            return nil
        }
        else {
            return queueArray.removeFirst()
        }
    }
    //print all
    public mutating func printAllElements() {
        guard count > 0  else {
            print("queue is empty")
            return
        }
        print("\nprint all queue elemets:")
        for (index, value) in queueArray.enumerated() {
            print("[\(index)]\(value)")
        }
    }
}
