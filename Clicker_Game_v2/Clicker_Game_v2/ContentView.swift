//
//  ContentView.swift
//  Clicker_Game_v2
//
//  Created by Jacob Robinett on 7/26/21.
//

import SwiftUI

struct UserPoints: Hashable {
    static func == (lhs: UserPoints, rhs: UserPoints) -> Bool {
        lhs.points == rhs.points
    }
    
    var points: Int = 0
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(floor(Double(points) / 100.0))
    }
}

struct ContentView: View {
    @State private var showDetails = false
    @State private var userPoints = UserPoints(points: 2)
    @State private var sliderVal = 5.0
    @State private var level = UIColor.systemBlue
    @State private var lastScore = 1
    
    var body: some View {
        // full screen stack
        ZStack {
            Color(level)
                .ignoresSafeArea()
            
            VStack {
                // smaller vstack w/ spacer at the bottom
                VStack {
                    Text("\(userPoints.points)")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding()
                    
                    Button("Click Me!"){
                        var mult = 1.0
                        mult = mult * sliderVal
                        userPoints.points = userPoints.points + Int(mult)
                        updateLevel()
                        //print(userPoints)     // testing only
                    }
                    .foregroundColor(.white)
                    
                    HStack {
                        Slider(
                            value: $sliderVal,      // current position of slider
                            in: 0...Double(userPoints.points),         // range
                            step: 1         // range step
                        ){
                            
                        }
                    }
                    .padding()
                    
                    Text("\(sliderVal)")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                        .padding()
                }
                //Spacer()    // pushes all content in the stack to the top of the screen
            }
        }
    }
    
    func updateLevel() {
        if userPoints.points - lastScore > 100 {
            let newColor = UIColor(hue: CGFloat(Double(abs(userPoints.hashValue) % 100) / 100.0), saturation: 0.5, brightness: 0.6, alpha: 1.0)
            level = newColor
            lastScore = userPoints.points
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
