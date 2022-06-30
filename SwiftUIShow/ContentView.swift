//
//  ContentView.swift
//  SwiftUIShow
//
//  Created by 杨杰 on 2022/6/30.
//

import SwiftUI

struct ContentView: View {
    
    var manager: DataManager = DataManager()
    
    @State private var singleSelection: UUID?

    
    var body: some View {
        NavigationView {
            List(selection: $singleSelection) {
                ForEach(manager.nodes) { node in
                    Section(header: Text("\(node.name ?? "unknown")")) {
                        if let childs = node.child {
                            ForEach(childs) { content in
                                NavigationLink {
                                    AnyView(router(name: content.router))
                                } label: {
                                    Text(content.name ?? "unknown")
                                }

                            }
                        }
                    }
                }
            }
            
//            List(manager.nodes, children: \.child) { node in
//                Text(node.name ?? "unknown")
//            }
//            .listStyle(.inset)
        }
        .navigationBarTitle("Home")
    }
    
    func router(name: String?) -> any View {
        if name == "Text" {
            return MMTextPage()
        } else if name == "Link" {
            return MMLinkPage()
        } else if name == "S&D" {
            return MMSpacerDividerPage()
        }
        return Text("unknown routerName \(name ?? "")")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
