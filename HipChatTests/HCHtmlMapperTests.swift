//
//  HCHtmlMapperTests.swift
//  HipChat
//
//  Created by GIB on 1/16/17.
//  Copyright © 2017 Xmen. All rights reserved.
//

import XCTest

class HCHtmlMapperTests: XCTestCase {
    
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
    let testLinkTitles: [[String: String]] = [
        ["url":"http://google.com","title":""], // google.com is using ISO/IEC 8859-1 encoding, thats why no title with utf8 encoding
        ["url":"http://cnn.com","title":"CNN.com - Breaking News, U.S., World, We"],
        ["url":"https://twitter.com/altonbrown/status/515267102408978432","title":"Alton Brown on Twitter: \"RT @B_Mon: Meatballs a la @altonbrown... #nowwewait #multitasker #dayoff http://t.co/xcLhSRvSa6\""],
        ["url":"http://www.nbcolympics.com","title":"NBC Olympics | Home of the 2016 Olympic"],
        ["url":"httpp://badurl","title":""],
        ["url":"http://adslfjawerwer.gov","title":""]
    ]
    
    // MARK: Test Cases
    func testLinkToTileMapper() {
        
        // Extract the urls from the test data
        
        var testCasePassed = false
        let links = self.testLinkTitles.map() { (input:[String:String]) -> String in
            return input["url"]!
        }
        
        let actualOutput: [[String: String]] = HCUtils.getTitleFromLink(links: links)
        print("\(actualOutput)")
  
        
        if let _ = self.testLinkTitles as [[String: String]]?,
            actualOutput.elementsEqual(actualOutput, by: { (obj1, obj2) -> Bool in
            return obj1.elementsEqual(obj2) { (elt1, elt2) -> Bool in
                return elt1.key == elt2.key && elt1.value == elt2.value
            }}) {
            
            testCasePassed = true
        }
        
        XCTAssert(testCasePassed, "Should have all the correct titles for the pages. Test titles MAY NEED UPDATING if this fails. Source pages may change")
    }
    
}
