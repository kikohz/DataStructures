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
    //斐波那契数列 递归方式
    //f(n) = f(n-1)+f(n-2)
    //0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233……
    func fibonacci(n:Int) ->Int {
        if n <= 0 {
            return 0
        }
        // n是1 和2的时候 都是1
        if n == 1 || n == 2 {
            return 1
        }
        
        return fibonacci(n: n-1) + fibonacci(n: n-2)
    }
    //循环方式
    func fibonacciF(n:Int) ->Int {
        if n <= 0  {
            return 0
        }
        if n == 1 {
            return 1
        }
        var firstNum = 0
        var secondNum = 1
        var result = 0
        for _ in 2...n {
            //规律就是前面的2个相加就是后面的一个值
            result = firstNum + secondNum
            //m每次把上一次的结果保存下来
            firstNum = secondNum
            secondNum = result
        }
        return result
    }
    //质数大于等于2不能被它本身和1以外的数整除
    func isPrime_1(n:Int) ->Bool {
        if n < 2 {
            return false
        }
        for i in 2...n-1 {
            if n%i == 0 {    //可以整除就不是质数
                return false
            }
        }
        return true
    }
    //我们把只包含因子2，3，5的数称为丑数（Ugly Number).
    //例如6，8都是丑数，但14不是，因为它含有因子7.习惯上我们把1当作第一个丑数
//所谓一个数m是另一个数n的因子，是指n能被m整除，也就是说n%m==0.根据丑数的定义，丑数只能被2，3，5整除。也就是说如果一个数能被2整除，我们把它连续除以2；如果能被3整除，就连续除以3；如果能被5整除，就除以5.如果最后我们得到的是1，那么这个数就是丑数，否则不是
    func isUgly(num:Int) ->Bool{
        var tempNum = num
        if tempNum == 0 {
            return false
        }
        else if tempNum == 1 {
            return true
        }
        while tempNum % 2 == 0 {
            tempNum /= 2
        }
        while tempNum % 3 == 0 {
            tempNum /= 3
        }
        while tempNum % 5 == 0 {
            tempNum /= 5
        }
        if tempNum == 1 {
            return true
        }
        else {
            return false
        }
    }
    
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var tempDict = [Int:Int]()
        for (index, value) in nums.enumerated() {
            let tempValue = target - value
            var tempkey = 0
            let istTurn = tempDict.contains(where: { (key, value) -> Bool in
                if value == tempValue {
                    tempkey = key
                    return true
                }
                return false
            })
            
            if istTurn {
                return [index,tempkey]
            }
            tempDict[index] = value
        }
        return [0,0]
//        var i = 0
//        for iValue in nums {
//            var j = 0
//            for jValue in nums {
//                if i != j{
//                    if iValue + jValue == target {
//                        return [i,j]
//                    }
//                }
//                j += 1
//            }
//            i += 1
//        }
//        return[0]
    }
    //[@"12-11", @"12-13",@"12-11", @"12-11", @"12-12", @"12-14"] 去除相同的并且排序
//    func outRepeat() {
//        let strArray = ["12-11", "12-13","12-11", "12-11", "12-12", "12-14"]
//        let temp = strArray.map {
//            String($0.sorted())
    //        }
    //        let setStr = Set(arrayLiteral: strArray)
    //    }
    //冒泡
    func bubbleSort( arr:inout [Int], n:Int) {
        for i in 0 ..< n-1 {
            for j in 0 ..< n-1-i {
                if arr[i] > arr[j + 1] {
                    arr.swapAt(i, j)
                }
            }
            
        }
    }
    func mySwap<T>(_ i: inout T, _ j: inout T) {
        let temp = i
        i = j
        j = temp
    }
    //选择排序
//选择排序（SelectionSort）是一种简单直观的排序算法。它的工作原理如下，首先在未排序序列中找到最小（大）元素，存放到排序序列的起始位置，然后，再从剩余未排序元素中继续寻找最小（大）元素，然后放到已排序序列的末尾。以此类推，直到所有元素均排序完毕
    func selectionSort(arr: inout [Int], n:Int) {
        for i in 0 ..< n {
            var min = i
            for j in i+1 ..< n {
                if j >= n {    //循环结束
                    break
                }
                //找出最小的，下标交换到min，内循环之后找出最小的
                if arr[j] < arr[min] {
                    min = j
                }
            }
            //做交换 把最小的放到前面
            arr.swapAt(i, min)
        }
    }
    //快速排序
    //每次排序的时候设置一个基准点，将小于等于基准点的数全部放到基准点的左边，将大于等于基准点的数全部放到基准点的右边
    func quickSort(arr: inout [Int], left:Int, right:Int) {    //arr待排序的数组。 left right 下标
        if left > right {
            return
        }
        let temp = arr[left]     //基准数
        var i = left,j = right
        while i != j {
            //先从右边开始找，小于基准数的(如果找到的数大于等于基准数，那我们继续循环找)
            while arr[j] >= temp && i < j {
                j -= 1
            }
            //左边k开始找， 左边大于基准数据的
            while arr[i] <= temp && i < j {
                i += 1
            }
            //x循环完毕，左右都找到了对于的位置，开始交换
            arr.swapAt(i, j)
            //把基准数归位
            arr.swapAt(left, i)
        }
        quickSort(arr: &arr, left: left, right: i-1)   //继续处理左边的
        quickSort(arr: &arr, left: i+1, right: right)   //继续处理右边的
        
    }
}
