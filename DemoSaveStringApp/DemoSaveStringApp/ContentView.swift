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
    @State private var showErrorAlert: Bool = false
    @State private var showSuccessAlert: Bool = false

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
                            showSuccessAlert = true
                        } catch {
                            showErrorAlert = true
                        }
                    }
                }
            }.alert("Error", isPresented: $showErrorAlert) {
                Button("OK") {}
            }.alert("Success", isPresented: $showSuccessAlert) {
                Button("OK") {}
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
