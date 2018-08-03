//
//  Algorithm.swift
//  DataStructures
//
//  Created by x on 2018/8/1.
//  Copyright © 2018年 x. All rights reserved.
//

import Foundation

struct Algorithm {
    func findTwoSum(_ array: [Int], target: Int) -> (Int,Int)? {
        guard array.count > 1 else {
            return nil
        }
        for i in 0..<array.count {
            let left = array[i]
            for j in (i+1)..<array.count {
                let right = array[j]
                if left + right == target {
                    return (i,j)
                }
            }
        }
        return nil
    }
    
    func test() {
        let array = [0,2,1,3,4]
        if let indexes = self.findTwoSum(array, target: 8) {
            print(indexes)
        }
        else {
            print("No pairs are found")
        }
        
        print(".....................................\n")
        
        let testArray = [4,3,5,1,0,7,6,9]
        print("initial array \(testArray)\n")
        _ = switchSort(testArray)
        
    }
    
    //排序
    func switchSort(_ array: [Int]) -> [Int] {
        var tempArray = array
        guard tempArray.count > 1 else {
            return tempArray
        }
        for i in 0..<tempArray.count {
            for j in i+1..<tempArray.count {
                if tempArray[i] > tempArray[j] {
                    tempArray.swapAt(i, j)
                    print(tempArray)
                }
            }
        }
        return tempArray
    }
    
    //冒泡
    func bubbleSort(_ array: [Int])-> [Int] {
        var tempArray = array
        guard tempArray.count > 1 else {
            return tempArray
        }
        for i in 0 ..< tempArray.count - 1 {
            var  swapped = false
            for j in 0 ..< tempArray.count - 1 - i {
                if tempArray[j] > tempArray[j+1] {
                    tempArray.swapAt(j, j+1)
                    swapped = true
                }
            }
            if swapped == false {
                break
            }
        }
        return tempArray
    }
    
    //选择排序
    func selectionSort(_ array: [Int]) -> [Int] {
        guard array.count > 1 else {
            return array
        }
        var tempArray = array
        for i in 0 ..< tempArray.count - 1 {
            var main = i
            for j in i+1 ..< tempArray.count {
                if tempArray[j] < tempArray[main] {
                    main = j
                }
            }
            if i != main {
                tempArray.swapAt(i, main)
            }
        }
        return array
    }
}

