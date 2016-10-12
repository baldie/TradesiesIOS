//
//  ViewController.swift
//  Tradesies
//
//  Created by David Baldie on 10/8/16.
//  Copyright © 2016 Tradesies Inc. All rights reserved.
//

import UIKit

class MarketplaceViewController: UIViewController {
    
    let API_KEY = "bf3ae48b-d884-4925-a412-78c0377f4ae1"
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Marketplace"
        
        refreshMarketplace()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func refreshMarketplace(){
        // Create the reqeuest
        let url = NSURL(string: "http://thetradesiesapp.com/Item/Browse")
        let request = NSMutableURLRequest(url: url as! URL)
        
        // Prepare the body
        let body = GetItemsRequest()
        request.httpBody = body.toString().data(using: .utf8)
    
        let json = NSString(data: request.httpBody!, encoding: String.Encoding.utf8.rawValue)
        print("Request Body: \(json)")
        
        // Set the headers
        let session = URLSession.shared
        request.addValue(API_KEY, forHTTPHeaderField: "api_key")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("\(body.toString().characters.count + 1)", forHTTPHeaderField: "Content-Length")
        request.httpMethod = "POST"
        print("%@", request.allHTTPHeaderFields)
        
    
        let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
            print("Response: \(response)")
            let strData = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print("Body: \(strData)")
            
            self.label.text = strData as String?
            //var json = JSONSerialization.jsonObject(with: data!, options: .mutableLeaves) as? NSDictionary
            
            // Did the JSONObjectWithData constructor return an error? If so, log the error to the console
            //print(err.localizedDescription)
        })
        
        task.resume()
    }
}

class GetItemsRequest {
    var UserId: String = "102"
    var Limit: Int = 10
    var Radius: Int = 15
    var Latitude: String = "40.77477477"
    var Longitude: String = "-73.97240294"
    var Offset: Int = 0
    var SearchTerms: [String] = []
    
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
