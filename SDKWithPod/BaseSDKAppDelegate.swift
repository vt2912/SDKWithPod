//
//  BaseSDKAppDelegate.swift
//  TestFramework
//
//  Created by Vu Thang on 1/3/18.
//  Copyright © 2018 Vu Thang. All rights reserved.
//

import UIKit
import GoogleSignIn


@UIApplicationMain
open class BaseSDKAppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {
    
    
    open var window: UIWindow?
    
    open func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        
        //Start Initialize sign-in
        if let clientId = SDKConfig.shared.myClientId{
            
            print("Set client id in SDK: \(clientId)")
            GIDSignIn.sharedInstance().clientID = clientId
        }else{
            
            print("Client id null")
        }
        
        GIDSignIn.sharedInstance().delegate = self
        //End initialize
        
        //Start Setup firstview:
        window = UIWindow(frame: UIScreen.main.bounds)
        let storyboardBundle = Bundle(for: BaseSDKAppDelegate.self)
        let storyBoard = UIStoryboard(name: "Main", bundle: storyboardBundle)
        let startViewController = storyBoard.instantiateViewController(withIdentifier: "StartViewController")
        window!.rootViewController = startViewController
        window!.makeKeyAndVisible()
        print("Base did finish launching")
        //End Setup FirstView
        
        return true
    }
    
    public func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        
        return GIDSignIn.sharedInstance().handle(url,
                                                 sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String,
                                                 annotation: options[UIApplicationOpenURLOptionsKey.annotation])
    }
    
    public func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        print("Did signin")
        print(user)
    }
    
    public func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        print("Did disconnect sign in")
    }
    

}
