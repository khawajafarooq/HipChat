//
//  HCChatProcessor.swift
//  HipChat
//
//  Created by GIB on 1/14/17.
//  Copyright © 2017 Xmen. All rights reserved.
//

import Foundation

class HCChatProcessor {

    let chatDetectors = HCChatMessageDetector.detecors()
    
    func jsonFromText(pText: String) -> String {
        
        var dictData: [String: AnyObject]! = self.processText(for: pText)
        self.cleanupModelForPresentation(pModelData: &dictData)
        
        var result = ""
        if dictData.count > 0 {
            result = self.jsonStringFrom(dataDictionary: dictData)
            result = result.replacingOccurrences(of: "\\", with: "")
        }
        return result
    }
    
    // MARK: Helper Methods
    
    func processText(for pMessage: String) -> [String: AnyObject]! {
        
        // Dictionary that has just the found strings
        var resultCollector = [String: [AnyObject]]()
        
        // loop over the detectors and gather up the found strings
        for detector in chatDetectors {
            
            resultCollector[detector.name] = detector.detect(pText: pMessage) as [AnyObject]?
        }
        
        if let msgLinks = resultCollector[Constants.Detector.Name.Links] as! [String]! {
            
            resultCollector[Constants.Detector.Name.Links] = HCUtils.getTitleFromLink(links: msgLinks) as [AnyObject]?
        }
        
        return resultCollector as [String : AnyObject]!
    }
    
    func cleanupModelForPresentation(pModelData:inout [String:AnyObject]!) {
        
        var keysToRemove = [String]()
        
        for detector in chatDetectors {
        
            if let value:AnyObject = pModelData[detector.name] {
                
                if let aValue = value as? [AnyObject] {
                    
                    if aValue.isEmpty {
                        // remove only if it's an empty array
                        keysToRemove.append(detector.name)
                    }else{
                        // keep these
                    }
                    
                }else{
                    // don't currently do anything with non array
                }
                
            }else {  // nothing under key...
                keysToRemove.append(detector.name)
            }
        }
        
        for key in keysToRemove{
            pModelData.removeValue(forKey: key)
        }
    }
    
    func jsonStringFrom(dataDictionary: [String:AnyObject]!) -> String {
        
        do {

            let jsonData: NSData = try JSONSerialization.data(withJSONObject: dataDictionary, options: .prettyPrinted) as NSData            
            return NSString(data: jsonData as Data, encoding: String.Encoding.utf8.rawValue)! as String
        }
        catch let error {
            print("error \(error.localizedDescription)")
        }
        
        return ""
    }
    
}
