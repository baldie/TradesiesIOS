//
//  ViewController.swift
//  Tradesies
//
//  Created by David Baldie on 10/8/16.
//  Copyright © 2016 Tradesies Inc. All rights reserved.
//

import UIKit

class MarketplaceViewController: UIViewController {
    
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
        
        // Fire the request
        let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
            
            let jsonResponse = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            
            print("Response: \(response)")
            print("Body: \(jsonResponse)")
        
            let response = GetItemsResponse(JSONString: (jsonResponse as String?)!)
            
            self.label.text = "Items returned: \(response.Items.count)"
        })
        
        task.resume()
    }
}
