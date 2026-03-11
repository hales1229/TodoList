//
//  noitemview.swift
//  TodoList
//
//  Created by tanlinzhen on 2026/2/9.
//

import SwiftUI

struct NoItemView: View {

    @State var animate: Bool = false
    let secondaryAccentColor = Color("SecondaryAccentColor")

    var body: some View {
        ScrollView {
            VStack {
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.semibold)

                Text("Are you a productive person? I think you should click the add button adn add a button of items to your todo list!!")
                    .padding(20)

                NavigationLink {
                    AddView()
                } label: {
                    Text("Add Something🥳")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .frame(minHeight: 55)
                        .background(animate ? secondaryAccentColor : Color.accentColor)
                        .cornerRadius(14)
                }
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(
                    color: animate ? secondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
                    radius: animate ? 30 : 10,
                    x: 0,
                    y: animate ? 50 : 30
                )
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(
            deadline: .now() + 1.5,
            execute: {
                withAnimation(
                    Animation
                        .easeInOut(duration: 2.0)
                        .repeatForever()
                ) {
                    animate.toggle()
                }
            }
        )
    }
}

#Preview {
    NavigationView {
        NoItemView()
            .navigationTitle("title")
    }

}
