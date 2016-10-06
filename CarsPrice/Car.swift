//
//  Car.swift
//  CarsPrice
//
//  Created by Sunny Do on 06/10/2016.
//  Copyright © 2016 Sunny Do. All rights reserved.
//

import UIKit

class Car: NSObject {
    var name: String!
    var capacity: CGFloat!
    var country: String!
    var originalPrice: CGFloat!
    var salePrice:CGFloat! = 0
    var error: NSError? = nil
    //init object
    init( name: String, capacity: CGFloat, country: String, originalPrice: CGFloat) {
        self.name = name
        self.capacity = capacity
        self.country = country
        self.originalPrice = originalPrice
    }
    //ID country
    var countries: NSDictionary = ["Europe" : 0, "USA" : 1, "Japan" : 2]
    //ID country exist -> valid, null (not exit) ->invalid
    var countriesHandel:[String : String] = ["Optional(0)" : "valid", "Optional(1)" : "valid", "Optional(2)" : "valid", "nil" : "inValid"]
    
    //100: low       // 010:medium    // 001:high
     var capacities: NSDictionary = ["true false false" : 0, "false true false" : 1, "false false true" : 2]
    //                        low   med  high
     var tax: [[CGFloat]] =  [[100,  120, 200],  //Europe
                            [ 75,    90,   150],  //USA
                            [ 70,    80,   135]] //Japan

    func calculateSalePrice (){
        let countryID:String = "\(countries.object(forKey: country) as? Int)"
        let categoryStr:String = countriesHandel[countryID]!
        perform(Selector(categoryStr))
    }
    
    func valid() {
        let x = countries.object(forKey: country) as! Int
        let capacityBitmask:String = "\(capacity <= 2) \(capacity > 2 && capacity < 5) \(capacity > 5)"
        let y:Int = capacities.value(forKeyPath: capacityBitmask) as! Int
        salePrice = (originalPrice + (tax[x][y] * originalPrice) / 100.0) * 1.12 * 47.0
    }
    
    func inValid() {
        error =  NSError(domain: "Invalid car", code: 1, userInfo: nil)
    }
    
   
}
