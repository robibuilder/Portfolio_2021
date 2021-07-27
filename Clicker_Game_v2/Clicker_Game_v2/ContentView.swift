//
//  ContentView.swift
//  Clicker_Game_v2
//
//  Created by Jacob Robinett on 7/26/21.
//

import SwiftUI

struct ContentView: View {
    @State private var showDetails = false
    @State private var userPoints = 0
    @State private var sliderVal = 5.0
    @State private var level = UIColor.systemBlue
    
    var body: some View {
        // full screen stack
        ZStack {
            Color(level)
                .ignoresSafeArea()
            
            VStack {
                // smaller vstack w/ spacer at the bottom
                VStack {
                    Text("\(userPoints)")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding()
                    
                    Button("Click Me!"){
                        var mult = 1.0
                        mult = mult * sliderVal
                        userPoints = userPoints + Int(mult)
                        updateLevel()
                        //print(userPoints)     // testing only
                    }
                    .foregroundColor(.white)
                    
                    HStack {
                        Slider(
                            value: $sliderVal,      // current position of slider
                            in: 0...10,         // range
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
    
    func updateLevel(){
        if(userPoints > 100){
            level = UIColor.systemPink
        }
        
        if(userPoints > 200){
            level = UIColor.systemGreen
        }
        
        if(userPoints > 300){
            level = UIColor.systemOrange
        }
        
        if(userPoints > 400){
            level = UIColor.systemYellow
        }
        
        if(userPoints > 500){
            level = UIColor.systemRed
        }
        
        if(userPoints > 600){
            level = UIColor.systemGray
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
