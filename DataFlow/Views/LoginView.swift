//
//  LoginView.swift
//  DataFlow
//
//  Created by Vasichko Anna on 24.07.2023.
//  Modified by Chupin Daniil on 26.07.2023.
//

import SwiftUI

struct LoginView: View {
    @AppStorage("name") private var name: String = ""
    @AppStorage("isRegistered") private var isRegistered: Bool = false
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name...", text: $viewModel.name)
                    .multilineTextAlignment(.center)
                Text("\(characterCount) characters")
                    .foregroundColor(viewModel.isNameValid ? .green : .red)
                    .padding(.horizontal)
            }
            .padding()
            
            Button(action: registerUser) {
                Label("OK", systemImage: "checkmark.circle")
            }
            .disabled(!viewModel.isNameValid)
        }
        .onChange(of: viewModel.name) { _ in
            viewModel.updateNameValidity()
        }
    }
    
    private func registerUser() {
        if viewModel.isNameValid {
            isRegistered = true
            name = viewModel.name
        }
    }
    
    private var characterCount: Int {
        viewModel.name.count
    }
}
