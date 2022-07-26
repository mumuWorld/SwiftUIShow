//
//  MMTextPage.swift
//  SwiftUIShow
//
//  Created by 杨杰 on 2022/6/30.
//

import SwiftUI

struct MMTextPage: View {
    
    @State var input: String = "Hello, World!"
    @State var lineLimit: String = "1"
    @State var isBold: Bool = true
    @State var isItalic: Bool = true
    
    @State var inputAlert: Bool = false
    @State var lineAlert: Bool = false


    @State var lineColor: Color = Color.yellow
    
    var body: some View {
        VStack {
            Text(input)
                .lineLimit(Int(lineLimit))
                .font(.system(size: 18))
                .bold(isBold)
                .italic(isItalic)
                .underline(true, color: lineColor)
                .padding(.bottom, 10)
            
//            + Text(input)
//                .lineLimit(Int(lineLimit))
//                .font(.system(size: 18))
//                .bold(isBold)
//                .underline(true, color: lineColor)
            
            Divider()
            
            Button {
                inputAlert = !inputAlert
            } label: {
                Tool.createAttrText(strs: ["Text(\"", input, "\")"], highIndex: [1])
            }.alert("change input", isPresented: $inputAlert) {
                TextField("输入", text: $input)
            }
            Button {
                lineAlert = !lineAlert
            } label: {
                Tool.createAttrText(strs: [".lineLimit(", lineLimit, ")"], highIndex: [1])
            }.alert("change line", isPresented: $lineAlert) {
                TextField("nil not limit", text: $lineLimit)
            }
            Button {
                isBold = !isBold
            } label: {
                Tool.createAttrText(strs: [".bold(", isBold ? "true" : "false", ")"], highIndex: [1])
            }
            //斜体
            Button {
                isItalic = !isItalic
            } label: {
                Tool.createAttrText(strs: [".italic(", isItalic ? "true" : "false", ")"], highIndex: [1])
            }
            ColorPicker(selection: $lineColor) {
                Tool.createAttrText(strs: [".underline(true, color: ", "lineColor", ")"], highIndex: [1])
            }
            .fixedSize()
//                .frame(width: 100)
        }
    }
}


struct MMLinkPage: View {
    
    @State var webStr: String = "https://www.example.com"
    
    @State var inputAlert: Bool = false

    @State var textColor: Color = Color.yellow

    @Environment(\.openURL) var openURL
    
    var body: some View {
        VStack {
            if let url = URL(string: webStr) {
                Link("open website: \(webStr)", destination: url)
                    .foregroundColor(textColor)
                    .font(.system(.title, weight: .heavy))
                    .environment(\.openURL, OpenURLAction { url in
                        print("Open \(url)")
//                        openURL(url, completion: {accepted in })
                        return .handled
                    })
            } else {
                Text("URL 不合法")
            }
            
            Divider()
            
            VStack(alignment: .leading) {
                Button {
                    inputAlert = !inputAlert
                } label: {
                    Tool.createAttrText(strs: ["Link(","\"open website: \\(webStr)\"", ",\n destination:","URL(string: webStr)", ")"], highIndex: [1,3])
                        .frame(alignment: .leading)
                        .lineLimit(nil)
                }
                .alert("change input", isPresented: $inputAlert) {
                    TextField("输入", text: $webStr)
                }
                ColorPicker(selection: $textColor) {
                    Tool.createAttrText(strs: [".foregroundColor(", "textColor", ")"], highIndex: [1])
                }
                .fixedSize()
            }
        }
    }
    
    func onOpenURLTap(_ url: URL, completion: @escaping (_ accepted: Bool) -> Void) {
        openURL(url, completion: completion)
    }
}

class Tool {
    static func createAttrText(strs: [String], highIndex: [Int]) -> some View {
        var attr = AttributedString("")
        var indexs = highIndex
        for (i, str) in strs.enumerated() {
            if indexs.contains(i) {
                let h = AttributedString(str, attributes: AttributeContainer().foregroundColor(.red))
                attr.append(h)
                indexs.removeFirst()
            } else {
                let h = AttributedString(str, attributes: AttributeContainer().foregroundColor(.blue))
                attr.append(h)
            }
        }
        return Text(attr).multilineTextAlignment(.leading)
    }
}

struct MMTextPage_Previews: PreviewProvider {
    static var previews: some View {
//        MMTextPage()
        MMLinkPage()
    }
}
