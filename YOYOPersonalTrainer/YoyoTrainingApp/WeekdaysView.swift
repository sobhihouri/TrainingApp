//
//  WeekdaysView.swift
//  YoyoTrainingApp
//
//  Created by Sobhi Houri on 2018-04-10.
//  Copyright © 2018 BigNerdRanch. All rights reserved.
//

import UIKit

class WeekdaysView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor=UIColor.clear
        
        setupViews()
    }
    //Setting up the constraints for weekdays
    func setupViews() {
        addSubview(myStackView)
        myStackView.topAnchor.constraint(equalTo: topAnchor).isActive=true
        myStackView.leftAnchor.constraint(equalTo: leftAnchor).isActive=true
        myStackView.rightAnchor.constraint(equalTo: rightAnchor).isActive=true
        myStackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive=true
        //Setting up array for days of the week
        var daysArr = ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"]
        for i in 0..<7 {
            let lbl=UILabel()
            lbl.text=daysArr[i]
            lbl.textAlignment = .center
            lbl.textColor = Style.weekdaysLblColor
            myStackView.addArrangedSubview(lbl)
        }
    }
    // interface for laying out a collection of views in either a column or a row.
    let myStackView: UIStackView = {
        let stackView=UIStackView()
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints=false
        return stackView
    }()
    //Unconditionally prints a given message and stops execution.
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
