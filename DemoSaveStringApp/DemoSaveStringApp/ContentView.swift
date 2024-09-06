//
//  ContentView.swift
//  DemoSaveStringApp
//
//  Created by Tiago Coelho on 06/09/2024.
//

import SwiftUI

struct ContentView: View {
    private var viewModel = ContentViewModel()
    @State private var text: String = ""
    @State private var showAlert: Bool = false

    var body: some View {
        VStack {
            TextField("Enter some text...", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Button("Store Text") {
                Task {
                    if !text.isEmpty {
                        do {
                            try await viewModel.saveString(myString: text)
                        } catch {
                            showAlert = true
                        }
                    }
                }
            }.alert("Error", isPresented: $showAlert) {
                Button("OK") {}
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
