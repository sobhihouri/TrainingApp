//
//  FirstViewController.swift
//  YoyoTrainingApp
//
//  Created by Sobhi Houri on 2018-04-03.
//  Copyright © 2018 BigNerdRanch. All rights reserved.
//

import UIKit
import GoogleSignIn
import Firebase


class FirstViewController: UIViewController, GIDSignInUIDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // setting up the button.
        setupGoogleButtons()
        
    }
    
    
    fileprivate func setupGoogleButtons() {
        //Adding google sign in button
        let googleButton = GIDSignInButton()
        //size and position of the  google sign in button
        googleButton.frame = CGRect(x: 150, y: 500, width: 100, height: 50)
        view.addSubview(googleButton)
        GIDSignIn.sharedInstance().uiDelegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

