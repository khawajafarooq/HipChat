//
//  HCChatMessageDetector.swift
//  HipChat
//
//  Created by GIB on 1/14/17.
//  Copyright © 2017 Xmen. All rights reserved.
//

/*
 HCChatMessageDetector
 Can create text detector based on own regex.
 */

import Foundation

class HCChatMessageDetector: HCTextDetector
{
    var name: String
    var regex: String
    
    init(pName: String, pRegex: String) {
        self.name = pName
        self.regex = pRegex
    }
    
    class func detecors() -> [HCTextDetector] {
        return [HCTextDetectorFactory.getDetector(pDetectorType: Constants.DetectorType.Mention),
                HCTextDetectorFactory.getDetector(pDetectorType: Constants.DetectorType.Emoticon),
                HCTextDetectorFactory.getDetector(pDetectorType: Constants.DetectorType.Link)]
    }
    
    // MARK: Conform to protocol method
    
    func detect(pText: String) -> [String] {
        return pText.matches(for: self.regex, in: pText)
    }
    
    
}
