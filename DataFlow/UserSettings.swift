//
//  File.swift
//  DataFlow
//
//  Created by Vasichko Anna on 24.07.2023.
//  Modified by Chupin Daniil on 26.07.2023.
//

import Foundation

final class UserSettings: ObservableObject {
    @Published var isRegistered = false
    var name = ""
}
