//
//  SaveStringService.swift
//  BasicSaveString
//
//  Created by Tiago Coelho on 06/09/2024.
//

import Foundation

public protocol SaveStringService {
    func execute(myString: String) async throws
}
