//
//  main.swift
//  arrayBenchmarkMac
//
//  Created by はるふ on 2018/05/15.
//  Copyright © 2018年 はるふ. All rights reserved.
//

import Foundation

extension Array {
    func showFirstAddress() {
        self.withUnsafeBufferPointer { pointer in
            print(pointer.baseAddress)
        }
    }
    
    func showWithPointer(count: Int) {
        self.withUnsafeBufferPointer { pointer in
            let seed = pointer.baseAddress?.advanced(by: count)
            print(seed, seed?.pointee)
        }
    }
    
    func showLastAddress() {
        self.withUnsafeBufferPointer { pointer in
            print(pointer.baseAddress?.advanced(by: pointer.endIndex).predecessor())
        }
    }
}

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
    var previousAddress: UnsafePointer<Int>?
    for i in 0..<10000000 {
        array.append(0)
        array.withUnsafeBufferPointer { pointer in
            if pointer.baseAddress != previousAddress {
                print(i, pointer.baseAddress!, array.capacity)
                previousAddress = pointer.baseAddress
            }
        }
    }
}

func replaceLetArray() {
    let array: [Int] = (0..<100).map { $0 }
    let pointer = UnsafeMutablePointer<Int>(mutating: array)
    
    print(pointer.advanced(by: 50).pointee)
    
    pointer.assign(repeating: 1, count: 80)
    
    print(pointer.advanced(by: 50).pointee)
}

func insertArray() {
    var array: [Int] = (0..<100).map { $0 }
    
    array.showFirstAddress()
    array.showWithPointer(count: 50)
    array.showLastAddress()
    print()
    
    
    array.insert(101, at: 20)
    array.showFirstAddress()
    array.showWithPointer(count: 50)
    array.showLastAddress()
    print()
    
    array.insert(-1, at: 0)
    array.showFirstAddress()
    array.showWithPointer(count: 50)
    array.showLastAddress()
}

func removeArray() {
    var array: [Int] = (0..<100).map { $0 }
    
    array.showFirstAddress()
    array.showWithPointer(count: 50)
    array.showLastAddress()
    print()
    
    
    array.remove(at: 50)
    array.showFirstAddress()
    array.showWithPointer(count: 50)
    array.showLastAddress()
    print()
    
    array.remove(at: 20)
    array.showFirstAddress()
    array.showWithPointer(count: 50)
    array.showLastAddress()
}

// removeArray()
// printPoints()
insertArray()


