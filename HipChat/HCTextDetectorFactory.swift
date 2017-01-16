//
//  HCChatDetectorFactory.swift
//  HipChat
//
//  Created by GIB on 1/14/17.
//  Copyright © 2017 Xmen. All rights reserved.
//

import Foundation

class HCTextDetectorFactory {
    
    // MARK: Factory to create Detectors
    class func getDetector(pDetectorType: Constants.DetectorType) -> HCTextDetector {
        
        var obj: HCTextDetector!
        
        switch (pDetectorType) {
            
        case Constants.DetectorType.Emoticon:
            obj = HCChatMessageDetector(pName: Constants.Detector.Name.Emoticons,
                                         pRegex: Constants.Detector.Regex.Emoticon)
            break
            
        case Constants.DetectorType.Mention:
            obj = HCChatMessageDetector(pName: Constants.Detector.Name.Mentions,
                                        pRegex: Constants.Detector.Regex.Mention)
            break
            
        case Constants.DetectorType.Link:
            obj = HCLinkDetector(pName: Constants.Detector.Name.Links,
                                 pRegex: Constants.Detector.Regex.None)
            break
        }
        
        return obj
    }
}
