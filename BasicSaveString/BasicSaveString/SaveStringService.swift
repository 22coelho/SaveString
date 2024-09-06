//
//  SaveStringService.swift
//  BasicSaveString
//
//  Created by Tiago Coelho on 06/09/2024.
//

import Foundation

public protocol SaveStringService {
    /// Executes a request to the server to store the string
    ///
    ///  - Parameters:
    ///     - myString: The string to be stored
    func execute(myString: String) async throws
}
