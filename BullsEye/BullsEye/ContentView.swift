//
//  ContentView.swift
//  BullsEye
//
//  Created by Nick Xu on 11/10/20.
//  Copyright © 2020 Nick Xu. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible: Bool = false
    @State var isVisitAboutView:Bool = false
    @State var sliderValue: Double = 50.0
    @State var target: Int = Int.random(in: 1...100)
    @State var score = 0
    @State var round = 1
    let midnightBlue = Color(red: 0.0/255.0, green: 51.0/255.0, blue: 102.0/255.0)
    struct LabelStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.white)
                .font(Font.custom("Arial Rounded MT Bold", size: 18))
                .modifier(Shadow())
        }
    }
    
    struct ValueStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.yellow)
                .font(Font.custom("Arial Rounded MT Bold", size: 24))
                .modifier(Shadow())
        }
    }
    
    struct ButtonLargeTextStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.black)
                .font(Font.custom("Arial Rounded MT Bold", size: 18))
        }
    }
    
    struct ButtonSmallTextStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.black)
                .font(Font.custom("Arial Rounded MT Bold", size: 12))
        }
    }
    
    struct ButtonStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .background(Image("Button"))
                .modifier(Shadow())
        }
    }
    
    struct Shadow: ViewModifier {
        func body(content: Content) -> some View {
            return content.shadow(color: Color.black, radius: 5, x: 2, y: 2)
        }
    }
   
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Text("Put the bullseye as close as you can to:").modifier(LabelStyle())
                    
                Text("\(self.target)").modifier(ValueStyle())
            }
            Spacer()
            // Slider row
            HStack {
                Text("1").modifier(LabelStyle())
                Slider(value: $sliderValue, in: 1...100).accentColor(Color.green)
                Text("100").modifier(LabelStyle())
            }
            Spacer()
            Button(action: {
                self.alertIsVisible = true
            }) {
                Text("Hit Me!").modifier(ButtonLargeTextStyle())
            }
            .alert(isPresented: $alertIsVisible){ () -> Alert in
                return Alert(title: Text(alertTitle()), message: Text(
                    "The slider's value is \(sliderValueRounded()).\n" +
                    "You scored \(self.pointsForCurrentRound()) points this round."
                ), dismissButton: .default(Text("Awesome")) {
                    self.score += self.pointsForCurrentRound()
                    self.target = Int.random(in: 1...100)
                    self.round += 1
                    })
            }
            .modifier(ButtonStyle())
            Spacer()
            // Button row
            HStack {
                Button(action: {
                    self.startNewGame()
                }) {
                    Image("StartOverIcon")
                    Text("Start Over").modifier(ButtonSmallTextStyle())
                    }.modifier(ButtonStyle())
                Spacer()
                Text("Score:").modifier(LabelStyle())
                Text("\(score)").modifier(ValueStyle())
                Spacer()
                Text("Round:").modifier(LabelStyle())
                Text("\(round)").modifier(ValueStyle())
                Spacer()
                //Navigation link with text label
//                NavigationLink(destination: AboutView(isActive: $isVisitAboutView), isActive: $isVisitAboutView,label:  { Button(action: { self.isVisitAboutView = true }, label: {
//                    Text("click")
//                }) })
                //Navigation link with image label
                //add "isVisitAboutView" is for resolve second view can be visited only once issue.
                NavigationLink(destination: AboutView(isActive: $isVisitAboutView), isActive: $isVisitAboutView,label:  { Button(action: { self.isVisitAboutView = true }) {
                        Image("InfoIcon")
                        Text("Info").modifier(ButtonSmallTextStyle())
                    }
                }).modifier(ButtonStyle())

            }.padding(.bottom, 20)
            // Score row
        }
        .background(Image("Background"), alignment: Alignment.center)
        .accentColor(midnightBlue)
        .navigationBarTitle("Bullseye")
    }
    
    func sliderValueRounded() -> Int {
        Int(sliderValue.rounded())
    }
    
    func amountOff() -> Int {
        abs(target - sliderValueRounded())
    }
    
    func pointsForCurrentRound() -> Int{
        let maximumScore = 100
        var bonus:Int
        let difference = amountOff()
        switch difference {
        case 0:
            bonus = 100
        case 1:
            bonus = 50
        default:
            bonus = 0
        }
        return maximumScore - difference + bonus
    }
    
    func alertTitle() -> String {
        let different = amountOff()
        let title: String
        if different == 0 {
            title = "Perfect!"
        } else if different < 5 {
            title = "You almost had it!"
        } else if different <= 10 {
            title = "Not bad."
        } else {
            title = "Are you even trying?"
        }
        return title
    }
    
    func startNewGame() {
        score = 0
        round = 1
        sliderValue = 50.0
        target = Int.random(in: 1...100)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
