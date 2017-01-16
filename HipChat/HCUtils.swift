//
//  HCUtils.swift
//  HipChat
//
//  Created by GIB on 1/14/17.
//  Copyright © 2017 Xmen. All rights reserved.
//

import Foundation
import UIKit

//Simply get the title from the given page string.  By default we truncate at 40 chars.
class HCHtmlParser {
    
    class func titleFromPage(page: NSString!) -> String!{
        if page == nil {
            return ""
        }
        
        // input will typically be from NSData.
        let html = page as String
        
        let titles:[String] = html.matches(for: Constants.Detector.Regex.HTMLPageTitle, in: html)
        if titles.count > 0 {
            
            let encodedString = titles[0]
            let encodedData = encodedString.data(using: String.Encoding.utf8)

            let attributedOptions : [String: AnyObject] = [
                NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType as AnyObject,
                NSCharacterEncodingDocumentAttribute: NSNumber(value: String.Encoding.utf8.rawValue) as AnyObject
            ]
            
            do {
                let attributedString = try NSAttributedString(data: encodedData!, options: attributedOptions, documentAttributes: nil)
                let decodedString = attributedString.string // The Weeknd ‘King Of The Fall’
                return decodedString
            } catch let error {
                
                print("Error: \(error.localizedDescription)")
            }
            
            

            
        }
        return ""
    }
    
}


class HCUtils {
    
    class func displayAlert(title: String, message: String, buttonTitle: String, controller: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: UIAlertActionStyle.default, handler: nil))
        controller.present(alert, animated: true, completion: nil)

    }
    
    class func getTitleFromLink(links: [String]!) -> [[String: String]]! {
        // Use the fun map method with a closure to do the work
        
        return links.map(){ (link: String) -> [String: String] in
            
            // Now return the dictionary to complete the [[String:String]] type in the output of the map
            let url = NSURL(string: link)
            if url == nil{
                return [Constants.MapperObject.Link.URL:link,
                        Constants.MapperObject.Link.Title:""]
            }
            
            do {
                let html = try String(contentsOf: url as! URL, encoding: String.Encoding.utf8)
                
                if html == nil {
                    return [Constants.MapperObject.Link.URL:link,
                            Constants.MapperObject.Link.Title:""]
                }
                else {
                    
                    return [Constants.MapperObject.Link.URL:link,
                            Constants.MapperObject.Link.Title:HCHtmlParser.titleFromPage(page: html as NSString!)]
                }
                
            } catch let error {
                
                print("Error: \(error.localizedDescription)")
            }
            
            return [Constants.MapperObject.Link.URL:link,
                    Constants.MapperObject.Link.Title:""]
        }
    }

}
