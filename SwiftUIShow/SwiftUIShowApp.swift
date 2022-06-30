//
//  SwiftUIShowApp.swift
//  SwiftUIShow
//
//  Created by 杨杰 on 2022/6/30.
//

import SwiftUI

@main
struct SwiftUIShowApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


func mm_printsLog(_ messages : Any..., file : String = #file, funcName : String = #function, lineNum : Int = #line) {
    #if DEBUG
       // 1.获取文件名,包含后缀名
       let name = (file as NSString).lastPathComponent
       // 1.1 切割文件名和后缀名
       let fileArray = name.components(separatedBy: ".")
       // 1.2 获取文件名
       let fileName = fileArray[0]
       // 2.打印内容
       print("🔨[\(fileName) \(funcName)](\(lineNum)): \(messages)")
    #endif
}
