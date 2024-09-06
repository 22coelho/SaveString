//
//  BasicSaveStringTests.swift
//  BasicSaveStringTests
//
//  Created by Tiago Coelho on 06/09/2024.
//

import XCTest
@testable import BasicSaveString

class SaveStringTests: XCTestCase {
    func testExecute_ServerThrowsError_ThrowsError() async {
        let service = DummySaveStringService()
        service.shouldThrow = true
        
        let sut = SaveString(service: service)
        do {
            try await sut.store(myString: "Dummy String")
            XCTAssert(false)
        } catch {
            XCTAssert(error._code == 400)
            XCTAssert(true)
        }
    }
    
    func testExecute_ServerDoesntThrow_NoThrownError() async {
        let service = DummySaveStringService()
        
        let sut = SaveString(service: service)
        do {
            try await sut.store(myString: "Dummy String")
            XCTAssert(true)
        } catch {
            XCTAssert(false)
        }
    }
}

class DummySaveStringService: SaveStringService {
    var shouldThrow: Bool = false
    
    func execute(myString: String) async throws {
        if shouldThrow {
            throw NSError(domain: "Dummy Error", code: 400)
        }
    }
}
