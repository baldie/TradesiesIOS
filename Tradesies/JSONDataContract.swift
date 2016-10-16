//
//  JSONDataContract.swift
//  Tradesies
//
//  Created by David Baldie on 10/14/16.
//  Copyright © 2016 Tradesies Inc. All rights reserved.
//

import Foundation

class JSONDataContract: NSObject {
    
    // Deserialize JSON to populate this object
    init(JSONString: String) {
        super.init()
        
        let JSONData = JSONString.data(using: String.Encoding.utf8, allowLossyConversion: false)
        
        do {
            let JSONDictionary = try JSONSerialization.jsonObject(with: JSONData!, options: .mutableLeaves) as! NSDictionary
            
            // Loop
            for (key, value) in JSONDictionary {
                let keyName = key as! String
                
                var keyValue: String = ""
                if value is String {
                    keyValue = value as! String
                }
                if value is NSDictionary {
                    print("topek")
                }
                
                // If property exists
                if (self.responds(to: Selector("\(keyName)"))) {
                    self.setValue(keyValue, forKey: keyName)
                }
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        // Or you can do it with using
        // self.setValuesForKeysWithDictionary(JSONDictionary)
        // instead of loop method above
    }
}
