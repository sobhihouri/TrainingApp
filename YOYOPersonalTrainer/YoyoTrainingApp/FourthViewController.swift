//
//  FourthViewController.swift
//  YoyoTrainingApp
//
//  Created by Sobhi Houri on 2018-04-10.
//  Copyright © 2018 BigNerdRanch. All rights reserved.
//

import UIKit
//enumerations for calendar app theme
enum MyTheme {
    case light
    case dark
}


class FourthViewController: UIViewController {
    //IBoutlets for calendar stack view and date picker
    @IBOutlet weak var calendarStackView: UIStackView!
    @IBOutlet weak var datePicker: UIDatePicker!
    //IBAction for the Send button
    @IBAction func sendButton(_ sender: Any) {
        setupAlert()
    }
    
    let formatterD = DateFormatter()
    //variables
    var theme = MyTheme.dark
    var widthAnchor: NSLayoutConstraint?
    var rightAnchor:NSLayoutConstraint?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.title = "Calendar"
        //The navigation bar managed by the navigation controller.
        self.navigationController?.navigationBar.isTranslucent=false
        //background color of the calendar
        self.view.backgroundColor=Style.bgColor
        
        datePicker.addTarget(self, action: #selector(datePickerChanged(picker:)), for: .valueChanged)
        formatterD.dateFormat = "dd"
        
        let rightBarBtn = UIBarButtonItem(title: "Light", style: .plain, target: self, action: #selector(rightBarBtnAction))
        self.navigationItem.rightBarButtonItem = rightBarBtn
        
        calenderView.translatesAutoresizingMaskIntoConstraints = false
    }
    //Setting up the alert action after the user presses the SEND button. After the user is alerted they can CLOSE the alert.
    func setupAlert(){
        let alertController = UIAlertController(title: "Appointment Booked", message: "I will get back to you within 24 hours", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "CLOSE", style: .cancel, handler: nil)
        alertController.addAction(alertAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //calendar stack view constraints
        calendarStackView.addSubview(calenderView)
        calenderView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive=true
        calenderView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive=true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //Calendar View Constraints
        calenderView.widthAnchor.constraint(equalToConstant: calendarStackView.bounds.size.width).isActive = true
        calenderView.heightAnchor.constraint(equalToConstant: calendarStackView.bounds.size.height).isActive = true
        //Datepicker synced with custom calendar
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            self.datePickerChanged(picker: self.datePicker)
        }
    }
    
    //Function for datepicker that links to the custom calendar
    func datePickerChanged(picker: UIDatePicker){
        for cell in calenderView.myCollectionView.visibleCells as [UICollectionViewCell] {
            cell.backgroundColor = UIColor.clear
            if(cell.subviews[1] as! UILabel).text! == "\(Int(formatterD.string(for: picker.date)!)!)"{
                cell.backgroundColor = UIColor.black
            }
        }
    }
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        calenderView.myCollectionView.collectionViewLayout.invalidateLayout()
    }
    //button that allows users to pick different themes.
    @objc func rightBarBtnAction(sender: UIBarButtonItem) {
        if theme == .dark {
            sender.title = "Dark"
            theme = .light
            Style.themeLight()
        } else {
            sender.title = "Light"
            theme = .dark
            Style.themeDark()
        }
        self.view.backgroundColor=Style.bgColor
        calenderView.changeTheme()
    }
    //value that determines whether the view’s autoresizing mask is translated into Auto Layout constraints.
    let calenderView: CalenderView = {
        let v=CalenderView(theme: MyTheme.dark)
        v.translatesAutoresizingMaskIntoConstraints=false
        return v
    }()
    
    
    
    
}
