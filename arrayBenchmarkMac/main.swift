//
//  main.swift
//  arrayBenchmarkMac
//
//  Created by はるふ on 2018/05/15.
//  Copyright © 2018年 はるふ. All rights reserved.
//

import Foundation

var array: [Int] = []
var previous = Date()
for _ in 0..<1048580 {
//for _ in 0..<10000000 {
    array.append(0)
//    array.withUnsafeBufferPointer { pointer in
//        print(pointer.baseAddress)
//    }
    let now = Date()
    print(now.timeIntervalSince(previous))
    previous = now
}
