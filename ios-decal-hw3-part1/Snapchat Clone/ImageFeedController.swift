//
//  ImageFeedController.swift
//  Snapchat Clone
//
//  Created by weili on 3/5/18.
//  Copyright © 2018 org.iosdecal. All rights reserved.
//

import UIKit

class FeedCell : UITableViewCell {
    @IBOutlet weak var feedName: UILabel!
    @IBOutlet weak var readImg: UIImageView!
    @IBOutlet weak var readTime: UILabel!
    var read : Bool = true
}

class ImageFeedController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITabBarDelegate {
    let cellHeight:CGFloat = 121
    var imageSendToDisplay: UIImage!
    
    @IBOutlet weak var tableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return threadNames.count
    }
    
    @IBOutlet weak var tabBar: UITabBarItem!
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print(1)
        tableView.reloadData()
    }
    
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell") as? FeedCell {
            let threadName = threadNames[indexPath.row]
            if threads[threadName]!.count > 0 {
                cell.readImg.image = #imageLiteral(resourceName: "unread")
                let currentTime = Date()
                let t = CFDateGetTimeIntervalSinceDate(currentTime as CFDate, threadsDate[threadName]! as CFDate)
                let new_t = Int(ceil((t/60)))
                if new_t == 1 {
                    cell.readTime.text = String(new_t) + " minute ago"
                } else {
                    cell.readTime.text = String(new_t) + " minutes ago"
                }
                
            } else {
                cell.readImg.image = #imageLiteral(resourceName: "read")
            }
            cell.feedName.text = threadName
            return cell
        } else {
            // Error handling
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath)as? FeedCell {
            let threadName = threadNames[indexPath.row]
            //if post has not read
            if threads[threadName]!.count > 0 {
                //change read status and img
                imageSendToDisplay = threads[threadName]?.removeFirst()
                if threads[threadName]!.count == 0 {
                    cell.readImg.image = #imageLiteral(resourceName: "read")
                }
                //display image
                performSegue(withIdentifier: "feedToDisplay", sender: self)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "feedToDisplay" {
                if let dest = segue.destination as? ImageDisplayController {
                    dest.imageToDisplay = imageSendToDisplay
                }
            }
        }
    }
    
    @IBAction func unwindToFeed(segue:UIStoryboardSegue) { }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
