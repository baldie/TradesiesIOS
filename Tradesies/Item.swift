//
//  Item.swift
//  Tradesies
//
//  Created by David Baldie on 10/13/16.
//  Copyright © 2016 Tradesies Inc. All rights reserved.
//

import Foundation

class Item: NSObject {
    var Id: Int = 0
    var Title: String = ""
    var Description: String = ""
    var Latitude: String = ""
    var Longitude: String = ""
    var Favored: Bool = false
    var IsActive: Bool = false
    var OwnerUserId: Int = 0
    var OwnerPhotoUrl: String = ""
    var Categories: [Int] = []
    var Distance: String = ""
    var Photos: [ItemPhoto] = []
    
    init(jsonDictionary: NSDictionary){
        super.init()
        
        for (key, value) in jsonDictionary {
            let keyName = key as! String
            switch(keyName){
                case "Photos":
                    let photosArray = ItemPhoto.deserializeArray(itemPhotosArray: value as! NSArray)
                    self.setValue(photosArray, forKey: keyName)
                    break
                    
                case "Id", "OwnerUserId":
                    let intValue = value as! Int
                    self.setValue(intValue, forKey: keyName)
                    
                case "Favored", "IsActive":
                    let boolValue = value as! Bool
                    self.setValue(boolValue, forKey: keyName)
                    
                case "Categories":
                    //todo: this
                    break
                    
                default:
                    if (value is String) {
                        let stringValue = value as! String
                        self.setValue(stringValue, forKey: keyName)
                    }
            }
        }
    }
    
    // This function returns an array of Items based off of the serialized data passed in
    static func deserializeArray(itemsArray: NSArray) -> [Item]{
        var items = [Item]()
        
        for itemEntry in itemsArray {
            let item = Item(jsonDictionary: itemEntry as! NSDictionary)
            items.append(item)
        }
        
        return items
    }
}
