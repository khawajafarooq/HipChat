//
//  HCConstants.swift
//  HipChat
//
//  Created by GIB on 1/14/17.
//  Copyright © 2017 Xmen. All rights reserved.
//

import Foundation



struct Constants {

    
    enum DetectorType {
        case Mention
        case Emoticon
        case Link
    }
    
    struct Detector {
        
        struct Name {
            static let Mentions = "mentions"
            static let Emoticons = "emoticons"
            static let Links = "links"
        }
        
        struct Regex {
            
            static let Mention = "@([\\w]+)"
            static let Emoticon = "\\(([\\w]{1,15}+)\\)"
            static let HTMLPageTitle = "<title\\b[^>]*>(.*?)</title>"
            static let None = ""
        }
    }
    
    struct MapperObject {
        
        struct Link {
            static let URL = "url"
            static let Title = "title"
        }
    }
    
    struct Labels {
        static let RequiredFieldError = "Please fill required field"
        static let ErrorAlertTitle = "Error"
        static let ErrorButtonTitle = "Ok"
    }
    
}
