//
//  ContentViewModel.swift
//  DemoSaveStringApp
//
//  Created by Tiago Coelho on 06/09/2024.
//

import BasicSaveString
import Foundation

public class ContentViewModel {
    public func saveString(myString: String) async throws {
        try await SaveString().store(myString: myString)
    }
}
