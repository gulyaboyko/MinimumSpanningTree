//
//  UnionFind.swift
//  MinimumSpanningTree
//
//  Created by Gulya Boiko on 8/14/20.
//  Copyright © 2020 com.gulya.boiko. All rights reserved.
//

import Foundation

struct UnionFind<T: Hashable> {
    private var index = [T: Int]()
    private var parent = [Int]()
    private var size = [Int]()

    public init() {}

    public mutating func addSetWith(_ element: T) {
        index[element] = parent.count
        parent.append(parent.count)
        size.append(1)
    }
    
    public mutating func inSameSet(_ firstElement: T, and secondElement: T) -> Bool {
        if let firstSet = setOf(firstElement), let secondSet = setOf(secondElement) {
            return firstSet == secondSet
        } else {
            return false
        }
    }

    public mutating func setOf(_ element: T) -> Int? {
        if let indexOfElement = index[element] {
            return setByIndex(indexOfElement)
        } else {
            return nil
        }
    }

    public mutating func unionSetsContaining(_ firstElement: T, and secondElement: T) {
        if let firstSet = setOf(firstElement), let secondSet = setOf(secondElement) {
            if firstSet != secondSet {
                for index in 0..<parent.count {
                    if parent[index] == firstSet {
                        parent[index] = secondSet
                    }
                }
                size[secondSet] += size[firstSet]
            }
        }
    }
    
    private mutating func setByIndex(_ index: Int) -> Int {
        return parent[index]
    }
}
