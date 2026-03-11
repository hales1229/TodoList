//
//  ListView.swift
//  TodoList
//
//  Created by tanlinzhen on 2026/2/6.
//

import SwiftUI

struct ListView: View {

    @EnvironmentObject var listViewModel: ListViewModel

    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {
                //transition 出现的转场效果
                NoItemView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("Todo List 📝")
        .toolbar { // iOS 16+ 之后使用toolbar
            if !listViewModel.items.isEmpty {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink("Add") {
                    AddView()
                }
            }
        }
//        .navigationBarItems(
//            leading: EditButton(),
//            trailing: NavigationLink("Add", destination: AddView())
//        )
    }
}

#Preview {
    NavigationView {
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}
