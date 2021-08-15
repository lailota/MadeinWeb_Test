//
//  DetailVCTests.swift
//  Teste_Laila_MadeinTests
//
//  Created by Laila Guzzon Hussein Lailota on 15/08/21.
//

import XCTest
@testable import Teste_Laila_Madein

class DetailVCTests: XCTestCase {

    var storyboard: UIStoryboard!
    var sut: DetailVC!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: "DetailVC") as DetailVC
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        storyboard = nil
        sut = nil
    }

    func testDetailVC_WhenCreated_HasRequieredOutsletsNotConnectd() throws {
        
        let videoTitleLabel = try XCTUnwrap(sut.videoTitleLabel, "The videoTitleLabel is not connected to an IBOutlet")
        let viewsLabel = try XCTUnwrap(sut.viewsLabel, "The viewsLabel is not connected to an IBOutlet")
        let imageView = try XCTUnwrap(sut.imageView, "The imageView is not connected to an IBOutlet")
        let descriptionTextView = try XCTUnwrap(sut.descriptionTextView, "The descriptionTextView is not connected to an IBOutlet")
        
        
        XCTAssertEqual(videoTitleLabel.text, "", "videoTitleLabel was not empty when the view controller initially loaded")
        XCTAssertEqual(viewsLabel.text, "", "viewsLabel was not correct displayed when the view controller initially loaded")
        XCTAssertEqual(descriptionTextView.text, "", "descriptionTextView was not correct displayed when the view controller initially loaded")
        XCTAssertEqual(imageView.image, nil, "imageView was not correct displayed when the view controller initially loaded")
    }

}
