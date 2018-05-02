//
//  UserTableViewController.swift
//  FinalProject
//
//  Created by weili on 4/9/18.
//  Copyright © 2018 weili. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase

class UserTableViewController : UIViewController, UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userProjs.count
    }
    @IBOutlet var sideMenu: UIView!
    
    @IBOutlet var sideMenuLeading: NSLayoutConstraint!
    
    @IBAction func openSideMenu(_ sender: Any) {
        if (sideMenuOpen) {
            sideMenuLeading.constant = menuCloseConst
            UIView.animate(withDuration: 0.3, animations: {self.view.layoutIfNeeded()})
        } else{
            sideMenuLeading.constant = menuOpenConst
            UIView.animate(withDuration: 0.3, animations: {self.view.layoutIfNeeded()})
        }
        sideMenuOpen = !sideMenuOpen
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "projCell", for: indexPath) as! ProjTableViewCell
        if let proj = getProjFromIndexPath(indexPath: indexPath) {
            cell.deadline.text = proj.deadline
            cell.title.text = proj.title
            cell.ProjDescription.text = proj.desription
        }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//
//        return tableView.rowHeight
//    }
//
    
    
    func updateData() {
        getProjs() { (projs) in
            if let projs = projs {
                clearLocalProjs()
                for proj in projs {
                    addProjToLocal(project: proj)
                }
                self.tableview.reloadData()
            }
        }
    }
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.bringSubview(toFront: sideMenu)
        tableview.delegate = self
        tableview.dataSource = self
        tableview.rowHeight = 150
        
        sideMenu.layer.shadowOpacity = 1
        sideMenu.layer.shadowRadius = 4
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateData()
    }
    
}
