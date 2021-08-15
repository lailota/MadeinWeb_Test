//
//  VideoTableViewCellTests.swift
//  Teste_Laila_MadeinTests
//
//  Created by Laila Guzzon Hussein Lailota on 15/08/21.
//

import XCTest
@testable import Teste_Laila_Madein

class VideoTableViewCellTests: XCTestCase {
    
    var nib: UINib!
    var sut: VideoTableViewCell!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        nib = UINib(nibName: "VideoTableViewCell", bundle: nil)
        sut = nib.instantiate(withOwner: VideoTableViewCell.self, options: nil)[0] as? VideoTableViewCell
        
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        nib = nil
    }
    
    func testVideoTableViewCell_WhenCreated_HasRequieredOutsletsNotConnectd() throws {
        
        let titleLabel = try XCTUnwrap(sut.titleLabel, "The titleLabel is not connected to an IBOutlet")
        let descriptionLabel = try XCTUnwrap(sut.descriptionLabel, "The descriptionLabel is not connected to an IBOutlet")
        let thumbnailImageView = try XCTUnwrap(sut.thumbnailImageView, "The thumbnailImageView is not connected to an IBOutlet")
        
        XCTAssertEqual(titleLabel.text, "Label", "titleLabel was not empty when the view controller initially loaded")
        XCTAssertEqual(descriptionLabel.text, "Label", "descriptionLabel was not empty when the view controller initially loaded")
        XCTAssertEqual(thumbnailImageView.image, nil, "thumbnailImageView was not correct displayed when the view controller initially loaded")
        
    }
    
}
