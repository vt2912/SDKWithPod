//
//  ViewController.swift
//  TestingProject
//
//  Created by Vu Thang on 1/2/18.
//  Copyright © 2018 Vu Thang. All rights reserved.
//

import UIKit
import GoogleSignIn

public class ViewController: UIViewController, GIDSignInUIDelegate {

    @IBOutlet weak var mSignInBtn: GIDSignInButton!
    @IBOutlet weak var mLabel: UILabel!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        GIDSignIn.sharedInstance().uiDelegate = self
        
        self.myTestFunc()
        if let mText = SDKConfig.shared.myTextOfLabel{
            
            mLabel.text = mText
        }else{
            
            mLabel.text = "No text to display"
        }
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func myTestFunc(){
        
        print("This is my function")
    }


}

