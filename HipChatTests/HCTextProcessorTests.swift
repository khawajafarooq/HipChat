//
//  HCChatDetectorTests.swift
//  HipChat
//
//  Created by GIB on 1/16/17.
//  Copyright © 2017 Xmen. All rights reserved.
//

import XCTest

class HCChatDetectorTests: XCTestCase {
    
    // MARK: Test Setup
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // MARK: Test Case Input
    
    let testMentions:Dictionary<String,[String]> =
        [   "nothing":[],
            "@test":["test"],
            "@test @best @ nope  @1 @thisisjustfineaswell":["test","best","1","thisisjustfineaswell"],
            "@test92929(":["test92929"],
            "(test),(@stuff),@(bill)":["stuff"]
        ]
    
    let testEmoticons:Dictionary<String,[String]> =
        [   "nothing":[],
            "(test)":["test"],
            "(test) (best) (nope ) ( northis) ( andnotthis ) (1) (thisisjustwaytoolong":["test","best","1"],
            "@(test)(bill)(@stuff)":["test","bill"]
    ]
    
    let testURLs:Dictionary<String,[String]> =
        [   "nothing to be found":[],
            "stuff http://hi  more stuff":["http://hi"],
            "more than http://something:8080/for/this.html just one https://else   ":["http://something:8080/for/this.html","https://else"]
        ]
    
    // MARK: Test Cases
    func testMentionsText() {
        
        let mentionDetector = HCTextDetectorFactory.getDetector(pDetectorType: Constants.DetectorType.Mention)
        
        for key in self.testMentions.keys {
            let result = mentionDetector.detect(pText: key)
            print("Result for key \(key) are: \(result)")
            XCTAssert(result == self.testMentions[key]!, "Same values")
            
        }
    }
    
    func testEmoticonsText() {
        
        let emoDetector = HCTextDetectorFactory.getDetector(pDetectorType: Constants.DetectorType.Emoticon)
        
        for key in self.testEmoticons.keys {
            let result = emoDetector.detect(pText: key)
            print("Result for key \(key) are: \(result)")
            XCTAssert(result == self.testEmoticons[key]!, "Same values")
            
        }
    }

    func testLinkText() {
        
        let linkDetector = HCTextDetectorFactory.getDetector(pDetectorType: Constants.DetectorType.Link)
        
        for key in self.testURLs.keys {
            let result = linkDetector.detect(pText: key)
            print("Result for key \(key) are: \(result)")
            XCTAssert(result == self.testURLs[key]!, "Same values")
        }
    }
    
    
}
