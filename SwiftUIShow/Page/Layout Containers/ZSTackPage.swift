//
//  ZSTackPage.swift
//  SwiftUIShow
//
//  Created by 杨杰 on 2022/7/21.
//

import SwiftUI

struct ZSTackPage: View {
    @State var pets: [Pet] = Pet.example()

    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                ForEach(pets) { pet in
                    Button {
                        
                    } label: {
                        Text(pet.name)
                    }.foregroundColor(Color.green)
                        .background {
                            Color.gray
                        }

                }
            }
//            .frame(maxWidth: .infinity, alignment: .leading)
            .background {
                Color.cyan
            }
        }
        .frame(maxWidth: .infinity, alignment: .topLeading)
        .background {
            Color.blue
        }
    }
}

struct ZSTackPage_Previews: PreviewProvider {
    static var previews: some View {
        ZSTackPage()
    }
}
