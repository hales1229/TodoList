//
//  ListViewModel.swift
//  TodoList
//
//  Created by tanlinzhen on 2026/2/6.
//

import Combine
import Foundation
import SwiftUI

class ListViewModel: ObservableObject {
    @State var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }

    let itemsKey = "items_list"

    init() {
        getItems()
    }

    func getItems() {
        //        let newItems = [
        //            ItemModel(title: "this is the first item", isCompleted: false),
        //            ItemModel(title: "this is the second", isCompleted: true),
        //            ItemModel(title: "thrid!", isCompleted: false),
        //        ]
        //        items.append(contentsOf: newItems)
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let saveItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }

        self.items = saveItems
    }

    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }

    func moveItem(form: IndexSet, to: Int) {
        items.move(fromOffsets: form, toOffset: to)
    }

    func savaItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }

    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
    }

    func saveItems() {
        if let data = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(data, forKey: itemsKey)
        }
    }
}
