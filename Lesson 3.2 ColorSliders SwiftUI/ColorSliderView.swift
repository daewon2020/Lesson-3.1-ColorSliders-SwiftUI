//
//  ColorSliderView.swift
//  Lesson 3.2 ColorSliders SwiftUI
//
//  Created by Константин Андреев on 30.04.2022.
//

import SwiftUI

struct ColorSliderView: View {
    @Binding var colorNumber: Double
    @State var colorText: String
    @State private var showAlert = false

    let sliderColor: Color
    
    var body: some View {
        HStack {
            Text("\(lround(colorNumber))")
                .frame(width: 35)
                .foregroundColor(.white)
            
            Slider(value: $colorNumber, in: (1...255), step: 1)
                .tint(sliderColor)
                .onChange(of: colorNumber) { newValue in
                    colorText = "\(lround(newValue))"
                }

            TextField("text", text: $colorText) { _ in
                if let colorNumber = Int(colorText), (1...255).contains(colorNumber) {
                    self.colorNumber = Double(colorNumber)
                    return
                }
                showAlert.toggle()
                colorText = "1"
                colorNumber = 1
            }
                .frame(width: 45)
                .textFieldStyle(.roundedBorder)
                .alert("Wrong value", isPresented: $showAlert, actions: {}) {
                    Text("Please enter value in 1...255")
                }
        }
    }
}

struct ColorSliderView_Previews: PreviewProvider {
    static var previews: some View {
        ColorSliderView(colorNumber: .constant(21.23), colorText: "12", sliderColor: .blue)
    }
}
