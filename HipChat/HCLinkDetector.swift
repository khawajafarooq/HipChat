//
//  HCLinkDetector.swift
//  HipChat
//
//  Created by GIB on 1/14/17.
//  Copyright © 2017 Xmen. All rights reserved.
//

import Foundation

class HCLinkDetector: HCTextDetector {
    
    var name: String
    var regex: String
    
    init(pName: String, pRegex: String) {
        self.name = pName
        self.regex = pRegex
    }

    
    func detect(pText :String) -> [String] {
        
        var result = [String]()
        
        do {
            
            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
            
            let matches = detector.matches(in: pText, options: NSRegularExpression.MatchingOptions(rawValue: NSRegularExpression.Options.caseInsensitive.rawValue), range: NSMakeRange(0, pText.characters.count))
            
            for match in matches as [NSTextCheckingResult] {
                result.append("\(match.url!)")
            }
            
            return result
        }
        catch let error {
            
            print("invalid regex: \(error.localizedDescription)")
        }
        
        return []
    }
    
}
