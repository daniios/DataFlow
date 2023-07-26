//
//  LoginViewModel.swift
//  DataFlow
//
//  Created by Даниил Чупин on 27.07.2023.
//

import Foundation

final class LoginViewModel: ObservableObject {
    @Published var name = ""
    @Published var isNameValid = false
    
    func updateNameValidity() {
        isNameValid = name.count >= 3
    }
}
