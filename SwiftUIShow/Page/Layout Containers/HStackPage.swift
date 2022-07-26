//
//  HStackPage.swift
//  SwiftUIShow
//
//  Created by 杨杰 on 2022/7/6.
//

import SwiftUI

struct HStackPage: View {
    @State var pets: [Pet] = Pet.example()

    var body: some View {
        HStack {
            ForEach(pets) { pet in
                Button {
                    
                } label: {
                    Text(pet.name)
                }.foregroundColor(Color.cyan)
                    .background {
                        Color.gray
                    }

            }
        }
    }
}

struct HStackPage_Previews: PreviewProvider {
    static var previews: some View {
        HStackPage()
    }
}
