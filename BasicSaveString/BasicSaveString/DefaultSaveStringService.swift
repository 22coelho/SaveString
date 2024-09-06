//
//  DefaultSaveStringService.swift
//  BasicSaveString
//
//  Created by Tiago Coelho on 06/09/2024.
//

import Foundation

class DefaultSaveStringService: SaveStringService {
    func execute(myString: String) async throws {
        guard let url = URL(string: "https://us-central1-mobilesdklogging.cloudfunctions.net/saveString") else {
            throw SaveStringServiceError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let body: [String: Any] = [
            "myString": myString,
        ]
        
        guard let jsonData = try? JSONSerialization.data(withJSONObject: body) else { return }
        request.httpBody = jsonData

        _ = try await URLSession.shared.data(for: request)
    }
}

enum SaveStringServiceError: Error {
    case invalidURL
}
