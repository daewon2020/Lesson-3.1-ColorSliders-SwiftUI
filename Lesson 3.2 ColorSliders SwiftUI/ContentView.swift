//
//  ContentView.swift
//  Lesson 3.1 ColorSliders SwiftUI
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
                colorSlider(color: $redSliderValue, focusState: $colorTextFieldIsFocused, sliderColor: .red)
                colorSlider(color: $greenSliderValue, focusState: $colorTextFieldIsFocused,sliderColor: .green)
                colorSlider(color: $blueSliderValue, focusState: $colorTextFieldIsFocused, sliderColor: .blue)
                Spacer()
            }.padding()
                .keyboardType(.numberPad)
        }.onTapGesture {
            colorTextFieldIsFocused = false
        }
        .toolbar {
            ToolbarItem(placement: .keyboard) {
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

struct colorSlider: View {
    @Binding var color: Double
    let focusState: FocusState<Bool>.Binding
    var sliderColor: Color
    private let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.roundingMode = .halfUp
        formatter.maximumFractionDigits = 0
        return formatter
    }()
    
    var body: some View {
        HStack {
            Text("\(lround(color))")
                .frame(width: 35)
                .foregroundColor(.white)
            Slider(value: $color, in: (1...255), step: 1) { _ in
                focusState.wrappedValue = false
            }.accentColor(sliderColor)
            TextField("", value: $color, formatter: formatter)
                .frame(width: 45)
                .textFieldStyle(.roundedBorder)
                .focused(focusState)
        }
    }
}
