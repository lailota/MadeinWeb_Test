//
//  Teste_Laila_MadeinTests.swift
//  Teste_Laila_MadeinTests
//
//  Created by Laila Guzzon Hussein Lailota on 15/08/21.
//

import XCTest
@testable import Teste_Laila_Madein

class Teste_Laila_MadeinTests: XCTestCase {

    var storyboard: UIStoryboard!
    var sut: MainVC!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: "MainVC") as MainVC
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        storyboard = nil
        sut = nil
    }

    
    func testMainVC_WhenCreated_HasRequieredOutsletsNotConnectd() throws {
        
        let searchTextField = try XCTUnwrap(sut.searchTextField, "The searchBar is not connected to an IBOutlet")
        
        XCTAssertEqual(searchTextField.text, "", "Search text field was not empty when the view controller initially loaded")
    }
    
    
    func testMainVC_WhenCreated_HasSearchButtonTappedAndAction() throws {
        // Arrange
        let searchButton: UIButton = try XCTUnwrap(sut.searchButton, "Search button does not have a referencing outlet")
        
        // Act
        let searchButtonActions = try XCTUnwrap(searchButton.actions(forTarget: sut, forControlEvent: .touchUpInside), "Search button does not have any actions assigned to it")
        
        // Assert
        XCTAssertEqual(searchButtonActions.count, 1)
        XCTAssertEqual(searchButtonActions.first, "searchButtonTapped:", "There is no action with a name searchButtonTapped assigned to search button")
    }

}
