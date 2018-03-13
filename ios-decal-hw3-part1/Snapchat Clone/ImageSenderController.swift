//
//  ImageSenderController.swift
//  Snapchat Clone
//
//  Created by weili on 3/6/18.
//  Copyright © 2018 org.iosdecal. All rights reserved.
//

import UIKit

class ThreadCell: UITableViewCell {
    @IBOutlet weak var threadName: UILabel!
}

class ImageSenderController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //let threadNames = ["memes", "dog spots", "random"]
    var imageToSend : UIImage!
    var selectedIndexPath : IndexPath!
    let cellHeight:CGFloat = 121

    
    @IBOutlet weak var namePostTo: UILabel!
    @IBAction func sendPost(_ sender: Any) {
        performSegue(withIdentifier: "unwindSegueToPicker", sender: self)
        if let img = imageToSend {
            if let index = selectedIndexPath {
                threads[threadNames[index.row]]?.append(img)
                threadsDate[threadNames[index.row]] = Date()
            }
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return threadNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "threadCell") as? ThreadCell {
            cell.threadName.text = threadNames[indexPath.row]
            return cell
        } else {
            // Error handling
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        namePostTo.text = threadNames[indexPath.row]
        selectedIndexPath = indexPath
    }
    
    @objc func loadList(notification: NSNotification){
        //load data here
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
