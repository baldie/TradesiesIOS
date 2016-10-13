//
//  GetItemRequest.swift
//  Tradesies
//
//  Created by David Baldie on 10/13/16.
//  Copyright © 2016 Tradesies Inc. All rights reserved.
//

import Foundation

class GetItemsRequest : NSObject {
    var UserId: String = "102"
    var Limit: Int = 10
    var Radius: Int = 15
    var Latitude: String = "40.77477477"
    var Longitude: String = "-73.97240294"
    var Offset: Int = 0
    var SearchTerms: [String] = []
    
    //TODO: fix manual serialization
    func toString() -> String {
        return "{" +
            "\"UserId\": \"0\"," +
            "\"Limit\": 12," +
            "\"Radius\": 15," +
            "\"Latitude\": \"40.77477477\"," +
            "\"Longitude\": \"-73.97240294\"," +
            "\"Offset\": 12" +
        "}"
    }
}
