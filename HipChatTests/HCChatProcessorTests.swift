//
//  HCChatProcessorTests.swift
//  HipChat
//
//  Created by GIB on 1/16/17.
//  Copyright © 2017 Xmen. All rights reserved.
//

import XCTest

class HCChatProcessorTests: XCTestCase {
    
    // MARK: Test Setup
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // MARK: Test Cases
    func testChatProcessor() {
        let processor = HCChatProcessor()
        let messages = ["@chris you around?", "Good morning! (megusta) (coffee)","Olympics are starting soon; http://www.nbcolympics.com","@bob @john (success) such a cool feature; https://twitter.com/jdorfman/status/430511497475670016"]
        
        for message in messages {
            let result = processor.jsonFromText(pText: message)
            
            print("Input: \(message)")
            print("Output:\n\(result)\n\n\n")
        }
    }
}
