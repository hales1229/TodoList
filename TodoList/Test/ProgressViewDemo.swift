//
//  ProgressViewDemo.swift
//  TodoList
//
//  Created by tanlinzhen on 2026/3/3.
//

import SwiftUI

struct ProgressViewDemo: View {

    @State private var progress = 0.5
    @State private var selectedTab = 0

    var body: some View {
        //        VStack {
        //            ProgressView(value: progress, total: 1.0)
        //                .progressViewStyle(.linear)
        //                .tint(.blue)
        //                .padding()
        //
        //            ProgressView()
        //                .progressViewStyle(.circular)
        //                .tint(.orange)
        //                .frame(width: 200, height: 200)
        //                .background(.blue)
        //        }

        //        Menu {
        //            Button("编辑", action: {})
        //            Button("删除", role: .destructive, action: {})
        //            Button("分享", action: {})
        //            Divider()
        //            Button("取消", role: .cancel, action: {})
        //        } label: {
        //            Label("更多操作", systemImage: "ellipsis.circle")
        //        }

        TabView(selection: $selectedTab) {
            Text("首页")
                .tabItem {
                    Label("首页", systemImage: "house")
                }
                .tag(0)
            
            Text("消息")
                .tabItem {
                    Label("消息", systemImage: "bell")
                }
                .tag(1)
            
            Text("我的")
                .tabItem {
                    Label("我的", systemImage: "person")
                }
                .tag(2)
        }
        .tint(.blue)
    }
}

#Preview {
    ProgressViewDemo()
}
