//
//  SaveString.swift
//  BasicSaveString
//
//  Created by Tiago Coelho on 06/09/2024.
//

import Foundation


public class SaveString {
    var service: SaveStringService = DefaultSaveStringService()
    
    public init() {}

    // In case the project who's using this framework has a custom SaveStringService implementation
    public init(service: SaveStringService) {
        self.service = service
    }
    
    public func store(myString: String) async throws {
        try await service.execute(myString: myString)
    }
}
