//
//  SecondViewController.swift
//  YoyoTrainingApp
//
//  Created by Sobhi Houri on 2018-04-03.
//  Copyright © 2018 BigNerdRanch. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var TableView: UITableView!
    

    var meals: [(serving:String, name:String, calories:String)]?
    //var workouts: [(rep:String, name:String, set:String)]?
    //Private variables for string arrays
    private var nameValue:[String] = []
    private var caloriesValue:[String] = []
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        TableView.delegate = self
        TableView.dataSource = self
        //Pulls data from dropbox URL
        let request = NSMutableURLRequest(url: NSURL(string: "https://www.dropbox.com/s/bkonewmb0jae416/Untitled.txt?raw=1")! as URL)
        httpGet(request: request)
    }
    


    func httpGet(request: NSURLRequest!) {
        let session = URLSession.shared
        let task = session.dataTask(with: request as URLRequest){(data, response, error) -> Void in
            if error != nil {
                print("\(error?.localizedDescription ?? "Error in httpGet")")
            } else {
                let result = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)!
                
                let results = NSRegularExpression.matches(for: "\\d+:.{1,}\\d", in: String(result))

                let delimeter = ":"
                for line in results{
                    let values = line.components(separatedBy: delimeter)
                    self.nameValue.append(values[1])
                    self.caloriesValue.append(values[2])
                    let meal = (serving:values[0], name:values[1], calories:values[2])
                    self.meals?.append(meal)
                }

                DispatchQueue.main.async {
                    self.TableView.reloadData()
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                }
            }
        }
        task.resume()
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameValue.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as UITableViewCell
        
        DispatchQueue.main.async {
            print("stuff")
            
            cell.textLabel?.text = self.nameValue[indexPath.row]
            cell.detailTextLabel?.text = self.caloriesValue[indexPath.row]
            
        }
        
        return cell
    }
    
}
