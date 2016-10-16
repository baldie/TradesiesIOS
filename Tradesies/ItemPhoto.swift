//
//  ItemPhoto.swift
//  Tradesies
//
//  Created by David Baldie on 10/13/16.
//  Copyright © 2016 Tradesies Inc. All rights reserved.
//

import Foundation

class ItemPhoto: NSObject {
    var PhotoId: Int = 0
    var IsPrimary: Bool = false
    var ImageData: String = ""
    var Url: String = ""
    
    init(jsonDictionary: NSDictionary){
        super.init()
        
        for (key, value) in jsonDictionary {
            let keyName = key as! String
            
            switch(keyName){
                case "PhotoId":
                    let intValue = value as! Int
                    self.setValue(intValue, forKey: keyName)
                    
                case "IsPrimary":
                    let boolValue = value as! Bool
                    self.setValue(boolValue, forKey: keyName)
                    
                default:
                    if (value is String) {
                        let stringValue = value as! String
                        self.setValue(stringValue, forKey: keyName)
                    }
            }
        }
    }

    static func deserializeArray(itemPhotosArray: NSArray) -> [ItemPhoto]{
        var itemPhotos = [ItemPhoto]()
        
        for itemPhotoEntry in itemPhotosArray {
            let itemPhoto = ItemPhoto(jsonDictionary: itemPhotoEntry as! NSDictionary)
            itemPhotos.append(itemPhoto)
        }
        
        return itemPhotos
    }
}
