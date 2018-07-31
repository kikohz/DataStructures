//
//  LinkedList.swift
//  DataStructures
//
//  Created by x on 2018/7/31.
//  Copyright © 2018年 x. All rights reserved.
//

import Foundation

public class LinkedListNode<T> {
    //value of a node
    var value: T
    
    //pointer to previous node
    weak var previous: LinkedListNode?
    
    //pointer to next node
    var next: LinkedListNode?

    public init(value: T) {
        self.value = value
    }
}

public class LinkedList<T> {
    public typealias Node = LinkedListNode<T>
    
    //pointer to the first node.
    private var head: Node?
    //pointer to the first node ,public
    public var first: Node? {
        return head
    }
    
    public var last: Node?{
        guard var node = head else {
            return nil
        }
        //
        while let next = node.next {
            node = next
        }
        return node
    }
    
    // if empty
    public var isEmpty: Bool {
        return head == nil
    }
    //total count of nodes
    public var count: Int {
        guard var node = head else {
            return 0
        }
        var count = 1
        while let next = node.next {
            node = next
            count += 1
        }
        return count
    }
    
    init() {
    }
    
    //
    public func node(atIndex index: Int) -> Node? {
        if index == 0 {
            return head
        }
        else {
            var node = head!.next
            guard index < count else {
                return nil
            }
            for _ in 1..<index {
                node = node?.next
                if node == nil {
                    break
                }
            }
            return node
        }
    }
    //MARK: insert
    // insert node to last index
    public func appendToTail(value: T) {
        let newNode = Node(value: value)
        if let lastNode = last {
            newNode.previous = lastNode
            lastNode.next = newNode
        }
        else {
            head = newNode
        }
    }
    //insert node to index 0
    public func insertToHead(value: T) {
        let newNode = Node(value: value)
        if head == nil {
            head = newNode
        }
        else {
            newNode.next = head
            head?.previous = newNode
            head = newNode
        }
    }
    
    //insert node in specific index
    public func insert(_ node: Node, atIndex index: Int) {
        if index < 0 {
            print("invalid input index")
            return
        }
        let newNode = node
        if count == 0 {
            head = newNode
        }
        else {
            if index == 0 {
                newNode.next = head
                head?.previous = newNode
                head = newNode
            }
            else {
                if index > count {
                    print("out of range")
                    return
                }
                let prev = self.node(atIndex: index-1)
                let next = prev?.next
                //
                newNode.previous = prev
                newNode.next = next
                prev?.next = newNode
                next?.previous = newNode
            }
        }
    }
    //MARK: remove
    //removing all node
    public func removeAll() {
        head = nil
    }
    
    //remove the last node
    public func removeLast() -> T? {
        guard !isEmpty else {
            return nil
        }
        return remove(node: last!)
    }
    //remove a node by it's refrence
    public func remove(node: Node)-> T? {
        guard head != nil else {
            print("linked list is empty")
            return nil
        }
        let prev = node.previous
        let next = node.next
        
        if let prev = prev {
            prev.next = next
        }
        else {
            head = next
        }
        
        next?.previous = prev
        
        node.previous = nil
        node.next = nil
        return node.value
    }
    //remove a node by it's index
    public func removeAt(_ index: Int) ->T? {
        guard head != nil else {
            print("linked list is empty")
            return nil
        }
        
        let node = self.node(atIndex: index)
        guard node != nil else {
            return nil
        }
        return remove(node: node!)
    }
    //MARK: print
    public func printAllNode() {
        guard head != nil else {
            print("linked list is empty")
            return
        }
        var node = head
        print("\nstart printing all nodes:")
        for index in 0..<count {
            if node == nil {
                break
            }
            print("[\(index)]]\(node!.value)")
            node = node!.next
        }
    }
    
}
