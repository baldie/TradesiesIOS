//
//  GetItemResponse.swift
//  Tradesies
//
//  Created by David Baldie on 10/13/16.
//  Copyright © 2016 Tradesies Inc. All rights reserved.
//

import Foundation

class GetItemsResponse :NSObject {
    
    var Items: [Item]
    var Error: String
    
    init(JSONString: String) {
        super.init()
        
        let JSONData = JSONString.data(using: String.Encoding.utf8, allowLossyConversion: false)
        
        var JSONDictionary: Dictionary
        
        do {
            JSONDictionary = try JSONSerialization.jsonObject(with: data!, options: .mutableLeaves) as! NSDictionary
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
        // Loop
        for (key, value) in JSONDictionary {
            let keyName = key as String
            let keyValue: String = value as String
            
            // If property exists
            if (self.respondsToSelector(NSSelectorFromString(keyName))) {
                self.setValue(keyValue, forKey: keyName)
            }
        }
        // Or you can do it with using
        // self.setValuesForKeysWithDictionary(JSONDictionary)
        // instead of loop method above
    }
}
