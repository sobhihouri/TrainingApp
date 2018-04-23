//
//  ThirdViewController.swift
//  YoyoTrainingApp
//
//  Created by Sobhi Houri on 2018-04-04.
//  Copyright © 2018 BigNerdRanch. All rights reserved.
//


import UIKit

class ThirdViewController: UIViewController {
    
    //Actions
    @IBAction func facebookButton(_ sender: Any) {
        //This will send the user to the clients Facebook page
        UIApplication.shared.open(URL(string: "https://www.facebook.com/yoyoo.haidar")! as URL, options: [:], completionHandler: nil)
        
    }
    
    @IBAction func instagramButton(_ sender: Any) {
        //This will send the user to the clients Facebook page
         UIApplication.shared.open(URL(string: "https://www.instagram.com/yoyoohaidar/")! as URL, options: [:], completionHandler: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
