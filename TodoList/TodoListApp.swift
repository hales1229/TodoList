//
//  TodoListApp.swift
//  TodoList
//
//  Created by tanlinzhen on 2026/2/10.
//

import SwiftUI

@main
struct TodoListApp: App {
    
    @StateObject var listViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
