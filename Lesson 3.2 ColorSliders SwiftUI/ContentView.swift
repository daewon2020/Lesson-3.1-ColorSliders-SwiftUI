//
//  ContentView.swift
//  Lesson 3.2 ColorSliders SwiftUI
//
//  Created by Константин Андреев on 28.04.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var redSliderValue = Double.random(in: 1...255)
    @State private var greenSliderValue = Double.random(in: 1...255)
    @State private var blueSliderValue = Double.random(in: 1...255)
    @FocusState private var colorTextFieldIsFocused: Bool
    
    var body: some View {
        ZStack{
            Color(.blue)
                .ignoresSafeArea()
            VStack(spacing: 25) {
                RoundedRectangle(cornerRadius: 20)
                    .frame(height: 150)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color(.white) ,lineWidth: 4))
                    .foregroundColor(Color(red: redSliderValue/255, green: greenSliderValue/255, blue: blueSliderValue/255))
        
                ColorSliderView(colorNumber: $redSliderValue, colorText: "\(lround(redSliderValue))", sliderColor: .red)
                ColorSliderView(colorNumber: $greenSliderValue, colorText: "\(lround(greenSliderValue))", sliderColor: .green)
                ColorSliderView(colorNumber: $blueSliderValue, colorText: "\(lround(blueSliderValue))", sliderColor: .blue)
                Spacer()
            }.padding()
                .keyboardType(.numberPad)
        }.onTapGesture {
            colorTextFieldIsFocused = false
        }
        .focused($colorTextFieldIsFocused)
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done") {
                    colorTextFieldIsFocused = false
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


