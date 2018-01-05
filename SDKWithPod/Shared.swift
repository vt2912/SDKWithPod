//
//  Shared.swift
//  TestFramework
//
//  Created by Vu Thang on 1/2/18.
//  Copyright © 2018 Vu Thang. All rights reserved.
//

import Foundation

public class SDKConfig {
    
    public var myTextOfLabel:String?
    public var myClientId:String?
    
    private init(){
        
        if let path = Bundle.main.path(forResource: "SDKConfig", ofType: "plist"), let dict = NSDictionary(contentsOfFile: path) as? [String: AnyObject] {
            
            print("Plist was read by SDK")
            print(dict)
            myTextOfLabel = dict["labelMessage"] as? String
            myClientId = dict["clientId"] as? String
            
        }else{
            
            print("SDK could not find Config file")
        }
    }
    
    public static let shared = SDKConfig()
}
