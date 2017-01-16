//
//  HCTextDetector.swift
//  HipChat
//
//  Created by GIB on 1/14/17.
//  Copyright © 2017 Xmen. All rights reserved.
//

import Foundation

// Behaves like abstract class of text detector
protocol HCTextDetector
{
    var name: String { get } /* name for text detector */
    var regex: String { get } /* regex for text detector */
    
    // Implementation will be provided by detectors subclass(es)
    func detect(pText: String) -> [String]
}
