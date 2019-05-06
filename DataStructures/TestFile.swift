//
//  TestFile.swift
//  DataStructures
//
//  Created by x on 2018/9/11.
//  Copyright © 2018年 x. All rights reserved.
//

import Foundation
struct Stack1<T> {
    var stacks = [T]()
    var isEmpty:Bool {return stacks.isEmpty}
    var count:Int { return stacks.count}
    var top: T? {
        if isEmpty {
            return nil
        }
        else {
            return stacks.last
        }
    }
    //
    fileprivate mutating func push(_ obj: T) {
        stacks.append(obj)
    }
    
    fileprivate mutating func pop()->T? {
        if isEmpty {
            return nil
        }
        else {
            return stacks.removeLast()
        }
    }
    
    
    func towSum(nums:[Int],_ target:Int)-> [Int] {
//        var set = Set<Int>()
//        for num in nums {
//            if set.contains(target-num) {
//                return true
//            }
//            set.insert(num)
//        }
//        return false
        //用来保存便利过的num和index,   num做key， index做value
        var dict = [Int:Int]()
        for(index,num) in nums.enumerated() {
            if let _ = dict[target-num] {
                return [index]
            }
            else {
                dict[num] = index
            }
        }
        return [-1]
    }
    
    
    // 给你一个字符串，要求按单词顺序反转 比如 the key is blue 反转的结果是 blue is sky the
    func _reverse<T>(_ chars:inout [T],_ start: Int, _ end: Int) {
        var start = start, end = end
        while start < end {
            _swap(&chars, start, end)
            start += 1
            end -= 1
        }
    }
    func _swap<T>(_ chars:inout [T],_ p:Int,_ q:Int) {
        (chars[p],chars[q]) = (chars[q],chars[p])
    }
    
    func revrtseWords(s:String?) -> String? {
        guard let s = s else {
            return nil
        }
        //先反转字符串  chars 数组目前为['t','h','e',' ','s'...]
        var chars = Array(s),start = 0
        _reverse(&chars, 0, chars.count-1)
        //chars 为反转之后的字符串了
        //然后我们在对单词进行反转
        for i in 0 ..< chars.count {
            //到了最后  或者碰到空格就开始反转
            if i == chars.count-1 || chars[i+1] == " " {
                _reverse(&chars, start, i)
                start = i+2   //因为有空格所以+2
            }
        }
        return String(chars)
    }
    //球0--100 中为偶数并且恰好是其他数字平方的数字
    func evenSquareNums(from: Int, to: Int)-> [Int] {
        var res = [Int]()
        res.reserveCapacity(to/2)
        for num in from ... to where num % 2 == 0 {    //是偶数
            if (from...to).contains(num * num) {   //判断是否包含其他数字平方
                res.append(num * num)
            }
        }
        (0...100).map {$0*$0}.filter{$0%2 == 0}
        return res
    }
}






struct ReverseStr {
    fileprivate func _swap<T> (_ chars:inout [T],_ p:Int,_ q:Int) {
        (chars[p],chars[q]) = (chars[q],chars[p])
    }
    fileprivate func _reverse<T> (_ chars:inout [T],_ start:Int,_ end:Int) {
        var start = start ,end = end
        //循环开始反转
        while start < end {
            _swap(&chars, start, end)
            start += 1
            end -= 1
        }
    }
    
    func reverseWords(s:String?)->String? {
        guard let s = s  else {
            return nil
        }
        var chars = Array(s),start = 0
        for i in 0 ..< chars.count {
            if i == chars.count-1 || chars[i+1] == " " {
                _reverse(&chars, start, i)
                start = i + 2
            }
        }
        return String(chars)
    }
}









































