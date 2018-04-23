//
//  Extensions.swift
//  YoyoTrainingApp
//
//  Created by Sobhi Houri on 2018-04-10.
//  Copyright © 2018 BigNerdRanch. All rights reserved.
//

import Foundation

extension NSRegularExpression{
    //convenience initializers for case sensitive quote patterns
    convenience init(pattern: String){
        try! self.init(pattern: pattern, options: [])
    }
    convenience init(quotePattern: String){
        try! self.init(pattern: "\\Q" + quotePattern + "\\E", options: [])
        
    }
    convenience init(caseInsensitiveQuotePattern: String){
        try! self.init(pattern: "\\Q" + caseInsensitiveQuotePattern + "\\E", options: [.caseInsensitive])
        
    }
    //Functions that replaces all the strings
    static func replaceAll(matchedString: String, regExp: NSRegularExpression, replacementString: String)->String{
        return regExp.stringByReplacingMatches(in: matchedString, options: [], range: NSRange(location: 0, length: matchedString.characters.count), withTemplate: replacementString)
    }
    static func replaceAll(matchedString: String, pattern: String, replacementString: String)->String{
        return (try! self.init(pattern: pattern, options: [])).stringByReplacingMatches(in: matchedString, options: [], range: NSRange(location: 0, length: matchedString.characters.count), withTemplate: replacementString)
    }
    //Checks to see if the strings match
    func matches(matchedString: String) -> Bool{
        let matchesNumber = self.numberOfMatches(in: matchedString, options: [], range: NSRange(location: 0, length: matchedString.characters.count))
        return matchesNumber == 0 ? false : true
    }
    //Function that matches the strings with the text in the URL
    static func matches(for regex: String, in text: String) -> [String] {
        let regex = NSRegularExpression(pattern: regex)
        let nsString = text as NSString
        let results = regex.matches(in: text, range: NSRange(location: 0, length: nsString.length))
        return results.map { nsString.substring(with: $0.range)}
    }
    
}
