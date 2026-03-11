//
//  ButtonStyle.swift
//  TodoList
//
//  Created by tanlinzhen on 2026/2/28.
//

import SwiftUI

struct ButtonStyle: View {
    /**
     frame最内层，padding最外层，链式调用被一层层包裹
     */
    var body: some View {
        Button {
            
        } label: {
            Text("click me")
        }
        .frame(maxWidth: .infinity)
        .font(.title2)
        .foregroundStyle(.white)
        .background(.purple)
        .buttonStyle(.borderedProminent)
        .tint(.blue)
        .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32))
    }
}

#Preview {
    ButtonStyle()
}
