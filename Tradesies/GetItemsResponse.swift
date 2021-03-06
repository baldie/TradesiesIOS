//
//  GetItemResponse.swift
//  Tradesies
//
//  Created by David Baldie on 10/13/16.
//  Copyright © 2016 Tradesies Inc. All rights reserved.
//

import Foundation

class GetItemsResponse: NSObject {
    var Items: [Item] = []
    var Error: String = ""
    
    // Deserialize JSON to populate this object
    init(JSONString: String) {
        super.init()
        
        let JSONData = JSONString.data(using: String.Encoding.utf8, allowLossyConversion: false)
        
        do {
            let JSONDictionary = try JSONSerialization.jsonObject(with: JSONData!, options: .mutableLeaves) as! NSDictionary
            
            // Loop through key value pairs in the dictionary
            for (key, value) in JSONDictionary {
                let keyName = key as! String
                
                // Only 2 properties on this type
                switch(keyName){
                    case "Items":
                        self.setValue(Item.deserializeArray(itemsArray: value as! NSArray), forKey: keyName)
                    
                    default:
                        if (value is String) {
                            self.setValue(value as! String, forKey: keyName)
                        }
                }
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
}
