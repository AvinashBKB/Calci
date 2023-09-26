//
//  ButtonGrid.swift
//  Calci
//
//  Created by Avinash kumar Boora on 8/7/23.
//

import SwiftUI

enum CalciMode {
    case notSet
    case addition
    case substraction
    case multiplication
    case percentage
    case division
    
}

struct ButtonGrid: View {
    @Binding var currentValue: String
    @State var currentMode: CalciMode = .notSet
    @State var lastButtonWasMode = false
    @State var savedInt = 0
    @State var currentInt = 0
    var body: some View {
        Grid {
            GridRow {
                CalciButtonBlack(color: .gray, buttonTextBlack: "AC", action: clearWasPressed)
                CalciButtonBlack(color: .gray, buttonTextBlack: "+/-", action: blackNumberWasPressed)
                CalciButtonBlack(color: .gray, buttonTextBlack: "%", action: blackModeWasPressed, mode: .percentage)
                CalciButton(color: .orange, buttonText: "÷", action: modeWasPressed, mode: .division)
            }
            GridRow {
                CalciButton(buttonText: "7", action: numberWasPressed)
                CalciButton(buttonText: "8", action: numberWasPressed)
                CalciButton(buttonText: "9", action: numberWasPressed)
                CalciButton(color: .orange, buttonText: "x", action: modeWasPressed, mode: .multiplication)
            }
            GridRow {
                CalciButton(buttonText: "4", action: numberWasPressed)
                CalciButton(buttonText: "5", action: numberWasPressed)
                CalciButton(buttonText: "6", action: numberWasPressed)
                CalciButton(color: .orange, buttonText: "-", action: modeWasPressed, mode: .substraction)
            }
            GridRow {
                CalciButton(buttonText: "1", action: numberWasPressed)
                CalciButton(buttonText: "2", action: numberWasPressed)
                CalciButton(buttonText: "3", action: numberWasPressed)
                CalciButton(color: .orange, buttonText: "+", action: modeWasPressed, mode: .addition)
            }
            GridRow {
                CalciButton (width: 148, buttonText: "0", action: numberWasPressed)
                    .gridCellColumns(2);
                CalciButton(buttonText: ".", action: numberWasPressed)
                CalciButton(color: .orange, buttonText: "=", action: equalWasPressed)
            }
        }
    }
    
    func numberWasPressed(button: CalciButton) {
        if lastButtonWasMode {
            lastButtonWasMode = false
            currentInt = 0
        }
        if let currentValueInt = Int("\(currentInt)" + button.buttonText) {
            currentInt = currentValueInt
            updateText()
        } else {
            currentValue = "Error"
            currentInt = 0
        }
    }
    
    func blackNumberWasPressed(button: CalciButtonBlack) {
        currentValue = button.buttonTextBlack
    }
    
    func modeWasPressed(button: CalciButton) {
        currentMode = button.mode
        lastButtonWasMode = true
    }
    
    func blackModeWasPressed(button: CalciButtonBlack) {
        currentMode = button.mode
        lastButtonWasMode = true
    }
    
    func clearWasPressed(button: CalciButtonBlack) {
        currentValue = "0"
        currentMode = .notSet
        lastButtonWasMode = false
        currentInt = 0
        savedInt = 0
    }
    
    func equalWasPressed(button: CalciButton) {
        if currentMode == .notSet || lastButtonWasMode {
            return
        }
        
        if currentMode == .addition {
            savedInt += currentInt
        } else if currentMode == .substraction {
            savedInt -= currentInt
        } else if currentMode == .multiplication {
            savedInt *= currentInt
        } else if currentMode == .percentage {
            savedInt %= currentInt
        } else if currentMode == .division {
            savedInt /= currentInt
        }
        
        currentInt = savedInt
        updateText()
        lastButtonWasMode = true
    }
    
    func updateText() {
        if currentMode == .notSet {
            savedInt = currentInt
        }
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        currentValue = formatter.string(for: currentInt) ?? "Error"
    }
}

struct ButtonGrid_Previews: PreviewProvider {
    @State static var currentValue = "1"
    static var previews: some View {
        ButtonGrid(currentValue: $currentValue)
    }
}
