//
//  MergeSort.swift
//  DataStructures
//
//  Created by Bllgo on 2019/6/15.
//  Copyright © 2019 x. All rights reserved.
//

import Foundation

extension Array where Element:Comparable {
    mutating func mergeSort(_ begin: Index, _ end: Index) {
        var tmp:[Element] = []
        tmp.reserveCapacity(count)
        //排序方法
        func merge(_ begin:Index,_ mid:Index, _ end:Index) {
            tmp.removeAll(keepingCapacity: true)
            var i = begin
            var j = mid
            
            while i != mid && j != end {
                if self[i] < self[j] {
                    tmp.append(self[i])
                    i += 1
                }
                else {
                    tmp.append(self[j])
                    j += 1
                }
            }
            //剩余一摞数据添加到tmp
            tmp.append(contentsOf: self[i ..< mid])
            tmp.append(contentsOf: self[j ..< end])
            print(tmp)
            replaceSubrange(begin..<end, with: tmp)
        }
        
        //2个元素肯定是排序好的，1个的话没办法排序，所以只要大雨2个就继续拆分
        if (end - begin) > 1 {   // 只要数组元素大于2，就继续拆分， 不然就以mid为中间对begin mid。和mid。end进行归并排序
            let mid = (begin + end) / 2
            
            print("begin = \(begin), mid = \(mid), end = \(end)")
            mergeSort(begin, mid)
            mergeSort(mid, end)
            merge(begin, mid, end)
        }
    }
}
