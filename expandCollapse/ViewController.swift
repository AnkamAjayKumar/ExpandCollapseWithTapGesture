//
//  ViewController.swift
//  expandCollapse
//
//  Created by Himansu Sekhar Panigrahi on 12/04/20.
//  Copyright © 2020 hpApps. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    let ar1 = ["AAAAAA","AAAAAA","AAAAAA"]
    let ar2 = ["BBBBBB","BBBBBB","BBBBBB"]
    let ar3 = ["CCCCCC","CCCCCC","CCCCCC"]
    
    let headreTitle = ["A@@@@","B@@@@@","C@@@@@"]
    
    let arrowUpImageName = "arrow.up"
    let arrowDownImageName = "arrow.down"
    
    
    var isExpanded = [false,false,false]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
       
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return headreTitle[0]
        }
        if section == 1 {
            return headreTitle[1]
        }
        if section == 2 {
            return headreTitle[2]
        }
        
        return ""
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isExpanded[section] {
            
            return ar1.count
        }
        else {
            
            return 0
        }
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        
        if(indexPath.section == 0) {
            cell.textLabel?.text = ar1[indexPath.row]
        }
        
        if(indexPath.section == 1) {
            cell.textLabel?.text = ar2[indexPath.row]
        }
        
        if(indexPath.section == 2) {
            cell.textLabel?.text = ar3[indexPath.row]
        }
        
        return cell
        
        
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let tapGseture = UITapGestureRecognizer(target: self, action: #selector(tapGestureEH(gesture:)))
        
        
        let headerView = UIView()
        headerView.backgroundColor = UIColor.green
        headerView.addGestureRecognizer(tapGseture)
        
        
        let titleLabel = UILabel()
        titleLabel.text = headreTitle[section]
        titleLabel.frame = CGRect(x: 10, y: 0, width: tableView.frame.width * 0.8, height: 50)
        titleLabel.backgroundColor = UIColor.green
        titleLabel.font = UIFont.boldSystemFont(ofSize: 15)
        headerView.addSubview(titleLabel)
        
        let arrowButton = UIButton()
        arrowButton.frame = CGRect(x: tableView.frame.width * 0.8, y: 0, width: tableView.frame.width * 0.1, height: 30)
        
        
        //This code is responsible for changing the arrow in the header
        if isExpanded[section] {
            arrowButton.setBackgroundImage(UIImage(systemName: arrowUpImageName), for: UIControl.State.normal)
        }
        else {
            arrowButton.setBackgroundImage(UIImage(systemName: arrowDownImageName), for: UIControl.State.normal)
            
        }
        
        arrowButton.tintColor = UIColor.black
        arrowButton.tag = section
        arrowButton.backgroundColor = UIColor.green
        
        headerView.addSubview(arrowButton)
        
        return headerView
    }

    @objc func tapGestureEH(gesture:UIGestureRecognizer) {
        let gestureView = gesture.view
        let subViews = (gestureView?.subviews)!
        var section:Int!
        var myButton:UIButton!
        var myTitle:UILabel!
        for subView in subViews {
            
            if let button = subView as? UIButton {
                section = button.tag
                myButton = button
            }
            else {
                myTitle = subView as? UILabel
            }
        }
        
        print(isExpanded[section])
        
        if isExpanded[section] {
            isExpanded[section] = false
            myButton.setBackgroundImage(UIImage(systemName: arrowDownImageName), for: UIControl.State.normal)
            myTitle.text = "Expanded"
            tableView.reloadData()

        }
        else {
            isExpanded[section] = true
            myButton.setBackgroundImage(UIImage(systemName: arrowUpImageName), for: UIControl.State.normal)
            myTitle.text = "NOT Expanded"
            tableView.reloadData()

        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    
}

