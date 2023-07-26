//
//  RootView.swift
//  DataFlow
//
//  Created by Vasichko Anna on 24.07.2023.
//  Modified by Chupin Daniil on 26.07.2023.
//

import SwiftUI

struct RootView: View {
    @AppStorage("name") private var name: String = ""
    @AppStorage("isRegistered") private var isRegistered: Bool = false
    
    var body: some View {
        Group {
            if isRegistered {
                ContentView(isRegistered: $isRegistered, userName: $name)
            } else {
                LoginView()
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
            .environmentObject(UserSettings())
    }
}
