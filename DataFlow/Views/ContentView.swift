//
//  ContentView.swift
//  DataFlow
//
//  Created by Vasichko Anna on 24.07.2023.
//  Modified by Chupin Daniil on 26.07.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var timer = TimeCounter()
    @Binding var isRegistered: Bool
    @Binding var userName: String
    
    var body: some View {
        VStack {
            Text("Hi, \(userName)!")
                .font(.largeTitle)
                .padding(.top, 50)
            Text(timer.counter.formatted())
                .font(.largeTitle)
                .padding(.top, 100)
            Spacer()
            CustomButtonView(buttonColor: .red, buttonText: timer.buttonTitle) {
                timer.startTimer()
            }
            CustomButtonView(buttonColor: .blue, buttonText: "Logout") {
                isRegistered.toggle()
            }
            Spacer()
        }
        .padding()
    }
}

struct CustomButtonView: View {
    let buttonColor: Color
    let buttonText: String
    let buttonAction: () -> Void
    
    var body: some View {
        Button(action: buttonAction) {
            Text(buttonText)
                .font(.title)
                .bold()
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(buttonColor)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black, lineWidth: 4)
        )
        .padding(25)
    }
}
