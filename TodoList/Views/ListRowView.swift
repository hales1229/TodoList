//
//  listrowview.swift
//  TodoList
//
//  Created by tanlinzhen on 2026/2/6.
//

import SwiftUI

struct ListRowView: View {
    var item: ItemModel
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundStyle(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

#Preview {
    let row1 = ItemModel(title: "this is the first item!", isCompleted: false)
    let row2 = ItemModel(title: "this is the second item!", isCompleted: true)
    Group {
        ListRowView(item: row1)
        ListRowView(item: row2)
    }
//    .previewLayout(.sizeThatFits)
}
