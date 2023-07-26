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
    @Binding var user: String
    
    var body: some View {
        VStack {
            Text("Hi, \(user)!")
                .font(.largeTitle)
                .padding(.top, 50)
            Text(timer.counter.formatted())
                .font(.largeTitle)
                .padding(.top, 100)
            Spacer()
            ButtonView(timer: timer)
            LogoutButtonView(isRegistered: $isRegistered)
            Spacer()
        }
        .padding()
    }
    
    private func logoutUser() {
        isRegistered.toggle()
    }
}

struct ButtonView: View {
    @ObservedObject var timer: TimeCounter
    
    var body: some View {
        Button(action: timer.startTimer) {
            Text(timer.buttonTitle)
                .font(.title)
                .bold()
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(.red)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black, lineWidth: 4)
        )
        .padding(50)
    }
}

struct LogoutButtonView: View {
    @Binding var isRegistered: Bool
    
    var body: some View {
        Button(action: logoutUser) {
            Text("Logout")
                .font(.title)
                .bold()
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(.blue)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black, lineWidth: 4)
        )
    }
    
    private func logoutUser() {
        isRegistered.toggle()
    }
}
