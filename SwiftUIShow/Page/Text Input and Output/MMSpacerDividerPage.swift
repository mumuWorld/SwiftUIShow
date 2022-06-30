//
//  MMSpacerDividerPage.swift
//  SwiftUIShow
//
//  Created by 杨杰 on 2022/6/30.
//

import SwiftUI

struct MMSpacerDividerPage: View {
    var body: some View {
        VStack {
            Text("top, World!")
            Divider().foregroundColor(Color.red)
                .backgroundStyle(.yellow)
            Text("bot, World!")
            
            Divider().foregroundColor(Color.red)
                .backgroundStyle(.yellow)
            HStack() {
                Text("left, World!")
                Spacer(minLength: 50)
                Text("right, World!sdfsdfsdfsdfsdfdsfsdfsfsdfsdf")
                    .lineLimit(1)
            }
        }
    }
}

struct MMSpacerDividerPage_Previews: PreviewProvider {
    static var previews: some View {
        MMSpacerDividerPage()
    }
}
