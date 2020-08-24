//
//  MinimumSpanningTree.swift
//  MinimumSpanningTree
//
//  Created by Gulya Boiko on 8/14/20.
//  Copyright © 2020 com.gulya.boiko. All rights reserved.
//

import Foundation

struct Edge: Hashable {
    let v1: Int // пара вершин,
    let v2: Int // которые связывают ребро
}

struct WeightedEdge {
    let v1: Int // пара вершин,
    let v2: Int // которые связывают ребро
    let w: Int  // вес ребра
}

struct MinimumSpanningTree {
    
    func kraskala(V: [[Int?]], weightedEdge: [WeightedEdge]) throws -> [Edge] {
        var result = [Edge]()
        // сортируем weightedEdge
        var sortedWeightEdge = weightedEdge.sorted { (l, r) -> Bool in
            return l.w < r.w
        }
        var set = UnionFind<Int>()
        for i in 0..<V.count {
            set.addSetWith(i)
        }
        // Обрабатываем первое минимальное ребро
        let firstE = sortedWeightEdge.removeFirst()
        result.append(Edge(v1: firstE.v1, v2: firstE.v2))
        set.unionSetsContaining(firstE.v1, and: firstE.v2)
        
        while result.count + 1 != V.count {
            // цикл по ребрам с минимальной до максимальной
            for (index, e) in sortedWeightEdge.enumerated() {
                if !set.inSameSet(e.v1, and: e.v2) {
                    result.append(Edge(v1: e.v1, v2: e.v2))
                    set.unionSetsContaining(e.v1, and: e.v2)
                    sortedWeightEdge.remove(at: index)
                    break
                }
                if index + 1 == sortedWeightEdge.count {
                    throw NSError()
                }
            }
        }
        return result
    }
     
}
