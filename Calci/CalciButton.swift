//
//  CalciButton.swift
//  Calci
//
//  Created by Avinash kumar Boora on 8/7/23.
//

import SwiftUI

struct CalciButton: View {
    var width: CGFloat = 70
    var color = Color(hue: 1.0, saturation: 0.0, brightness: 0.283)
    var buttonText = "1"
    var action: (CalciButton) -> Void = {_ in }
    var mode: CalciMode = .notSet
    var body: some View {
        Button {
           action(self)
        } label: {
            Text(buttonText)
                .font(.largeTitle)
                .frame(width: width, height: 70, alignment: .center)
                .background(color)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 60))
        }
    }
    
    
}

struct CalciButtonBlack: View {
    var width: CGFloat = 70
    var color = Color(hue: 1.0, saturation: 0.0, brightness: 0.283)
    var buttonTextBlack = "2"
    var action: (CalciButtonBlack) -> Void = {_ in }
    var mode: CalciMode = .notSet
    var body: some View {
        Button {
            action(self)
        } label: {
            Text(buttonTextBlack)
                .font(.largeTitle)
                .frame(width: width, height: 70, alignment: .center)
                .background(color)
                .foregroundColor(.black)
                .clipShape(RoundedRectangle(cornerRadius: 60))
        }
    }
}

struct CalciButton_Previews: PreviewProvider {
    static var previews: some View {
        CalciButton()
    }
}
