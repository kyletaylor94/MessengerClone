//
//  ContentView.swift
//  MessengerClone
//
//  Created by Turdesan Csaba on 05/02/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    var body: some View {
        Group{
            if viewModel.userSession != nil {
                ConversationView()
            } else {
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
}
