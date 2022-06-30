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
        
    }
    
    
}

struct ExampleNode {
    
    enum NodeType {
        case header
        case content
    }
    
    var nodeType: NodeType = .content
    
    var title: String = ""
    
    var routerName: String = ""
}
