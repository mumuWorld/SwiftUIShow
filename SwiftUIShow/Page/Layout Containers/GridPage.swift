//
//  GridPage.swift
//  SwiftUIShow
//
//  Created by 杨杰 on 2022/7/6.
//

import SwiftUI

/// A container view that arranges other views in a two dimensional layout. 在二维布局中排列其他视图的容器视图。
struct GridPage: View {
    @State var pets: [Pet] = Pet.example()
    
    var body: some View {
        VStack {
            //元素左对齐
            Grid(alignment: .leading) {
                ForEach(pets) { pet in
                    GridRow {
                        Text(pet.name)
                        ProgressView(value: pet.percent)
                        //让最列中元素对其
                        Text("\(pet.age)").gridColumnAlignment(.trailing)
                    }
                    GridRow {
                        //让divider跨越三个列
                        Divider().gridCellColumns(3)
                    }
                }
            }.padding(.all, 8)
        }
    }
}

struct Pet: Identifiable {
    let id = UUID()
    
    var name: String = ""
    var percent: Double = 0.2
    var age: Int = 19
    
    static func example() -> [Pet] {
        let arr = [
            Pet(name: "tom", percent: 0.3, age: 25),
            Pet(name: "jerry", percent: 0.8, age: 2),
            Pet(name: "tom cat", percent: 0.3, age: 25),
        ]
        return arr
    }
}

struct GridPage_Previews: PreviewProvider {
    static var previews: some View {
        GridPage()
    }
}
