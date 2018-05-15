//
//  main.swift
//  arrayBenchmarkMac
//
//  Created by はるふ on 2018/05/15.
//  Copyright © 2018年 はるふ. All rights reserved.
//

import Foundation

func printIntervals() {
    var array: [Int] = []
    var previous = Date()
    for _ in 0..<1048580 {
        array.append(0)
        let now = Date()
        print(now.timeIntervalSince(previous))
        previous = now
    }
}

func printPoints() {
    var array: [Int] = []
    var previousAddress: UnsafeMutablePointer<Int>?
    for i in 0..<10000000 {
        array.append(0)
        array.withUnsafeMutableBufferPointer { pointer in
            if pointer.baseAddress != previousAddress {
                print(i, pointer.baseAddress!)
                previousAddress = pointer.baseAddress
            }
        }
    }
}

printPoints()
