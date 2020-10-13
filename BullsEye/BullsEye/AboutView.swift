//
//  AboutView.swift
//  BullsEye
//
//  Created by Nick Xu on 12/10/20.
//  Copyright © 2020 Nick Xu. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    @Binding var isActive: Bool
    let beige = Color.init(red: 255.0/255.0, green: 214.0/255.0, blue: 179.0/255.0)
    struct AboutHeaderStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.black)
                .font(Font.custom("Arial Rounded MT Bold", size: 30))
                .padding(.top,20)
                .padding(.bottom,20)
        }
    }
    struct AboutBodyStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.black)
                .font(Font.custom("Arial Rounded MT Bold", size: 16))
                .padding(.leading,60)
                .padding(.trailing,60)
                .padding(.bottom,20)
        }
    }
    var body: some View {
        Group {
            VStack {
                Text("🎯  Bullseye 🎯")
                    .modifier(AboutHeaderStyle())
                Text("This is Bullseye, the game where you can win points and earn fame by dragging a slider.")
                    .modifier(AboutBodyStyle()).lineLimit(nil)
                Text("Your goal is to place the slider as close as possible to the target value. The closer you are, the more points you score.").lineLimit(nil)
                .modifier(AboutBodyStyle())
                Text("Enjoy!").lineLimit(nil)
                .modifier(AboutBodyStyle())
                
            }
            .background(beige)
            .navigationBarItems(leading: Button(action: {self.isActive = false}, label: {Text("Back")}))
            .navigationBarTitle("About Bullseye")
        }
        .background(Image("Background"))

    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView(isActive: .constant(true)).previewLayout(.fixed(width: 896, height: 414))
    }
}
