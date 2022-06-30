//
//  ExampleNode.swift
//  SwiftUIShow
//
//  Created by 杨杰 on 2022/6/30.
//

import Foundation

class DataManager {
    
    var nodes: [ExampleNode] = []
    
    init() {
        let path = Bundle.main.path(forResource: "example", ofType: "json")
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path!))
            let list = try JSONDecoder().decode([ExampleNode].self, from: data)
            nodes = list
            mm_printsLog(list)
        } catch let e {
            print(e)
        }
        
    }
    
    
}

struct ExampleNode: Codable, Identifiable {
    
    let id = UUID()
    
    enum NodeType: Codable {
        case header
        case content
    }
    
    var nodeType: NodeType {
        if type == "header" {
            return .header
        }
        return .content
    }
    
    var type: String?
    
    var name: String?
    
    var router: String?
    
    var child: [ExampleNode]?
    
    private enum CodingKeys: String, CodingKey {
        case type
        case name
        case child
        case router
    }
}
