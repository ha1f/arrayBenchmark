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
    array.append(0)
    let now = Date()
    print(now.timeIntervalSince(previous))
    previous = now
}
