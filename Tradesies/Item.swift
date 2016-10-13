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
    
    override init(){
        
    }
}
