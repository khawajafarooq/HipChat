//
//  String+Helper.swift
//  HipChat
//
//  Created by GIB on 1/14/17.
//  Copyright © 2017 Xmen. All rights reserved.
//

import Foundation

extension String {
    
    func matches(for regex: String, in text: String) -> [String] {
        
        var output = [String]()
        
        // return empty if empty
        if self.isEmpty {
            return output
        }
        
        do {

            if let pattern = try NSRegularExpression(pattern: regex, options: NSRegularExpression.Options.caseInsensitive) as NSRegularExpression? {
                
                pattern.enumerateMatches(in: self, options: NSRegularExpression.MatchingOptions.withoutAnchoringBounds,
                                     range: NSMakeRange(0,self.utf16.count), using: { (match, statusFlags, stop) -> Void in
                    
                    let noOfRanges = (match?.numberOfRanges)!
                    
                    if(noOfRanges > 1) {
                        
                        for index in 1..<noOfRanges {
                            let range = match?.rangeAt(index)
                            output.append(self.substringWithRange(range: range))
                        }
                        
                    } else {
                        
                        // No capture groups. index 0 is the whole match
                        let range = match?.rangeAt(0)
                        output.append(self.substringWithRange(range: range))
                        
                    }
                })
            }
            
            return output
            
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }

    func substringWithRange(range: NSRange!) -> String{
        let nsString = self as NSString
        return nsString.substring(with: range) as String
    }
}
