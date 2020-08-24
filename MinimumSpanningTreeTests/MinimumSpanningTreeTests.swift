//
//  MinimumSpanningTreeTests.swift
//  MinimumSpanningTreeTests
//
//  Created by Gulya Boiko on 8/13/20.
//  Copyright © 2020 com.gulya.boiko. All rights reserved.
//

import XCTest

final class MinimumSpanningTreeTests: XCTestCase {
    
    let V: [[Int?]] = [
        [1, 3, nil, nil, nil],
        [0, 2, 3, 4, nil],
        [1, 4, nil, nil, nil],
        [0, 1, 4, 6, nil],
        [1, 2, 3, 6, 5],
        [4, 6, nil, nil, nil],
        [3, 4, 5, nil, nil]
    ]
    let weightedEdge: [WeightedEdge] = [
        WeightedEdge(v1: 0, v2: 1, w: 7),
        WeightedEdge(v1: 0, v2: 3, w: 5),
        WeightedEdge(v1: 1, v2: 2, w: 8),
        WeightedEdge(v1: 1, v2: 3, w: 9),
        WeightedEdge(v1: 1, v2: 4, w: 7),
        WeightedEdge(v1: 2, v2: 4, w: 5),
        WeightedEdge(v1: 3, v2: 4, w: 15),
        WeightedEdge(v1: 3, v2: 6, w: 6),
        WeightedEdge(v1: 4, v2: 6, w: 8),
        WeightedEdge(v1: 4, v2: 5, w: 9),
        WeightedEdge(v1: 5, v2: 6, w: 11)
    ]
    
    func test_kraskala() {
        print(try? MinimumSpanningTree().kraskala(V: V, weightedEdge: weightedEdge))
    }
    
    func test_UnionFind() {
        var sut = UnionFind<Int>()
        sut.addSetWith(0)
        sut.addSetWith(1)
        sut.addSetWith(2)
        sut.addSetWith(3)
        sut.addSetWith(4)
        XCTAssertFalse(sut.inSameSet(0, and: 1))
        sut.unionSetsContaining(1, and: 0)
        sut.unionSetsContaining(2, and: 1)
        XCTAssertTrue(sut.inSameSet(0, and: 1))
        XCTAssert(sut.setOf(0) == 0)
        XCTAssert(sut.setOf(1) == 0)
        XCTAssert(sut.setOf(2) == 0)
        sut.unionSetsContaining(10, and: 0)
    }
}
