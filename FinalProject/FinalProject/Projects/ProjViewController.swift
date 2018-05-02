//
//  ProjViewController.swift
//  FinalProject
//
//  Created by weili on 4/8/18.
//  Copyright © 2018 weili. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ProjViewController: UIViewController {
    
    @IBOutlet weak var projDescription: UITextView!
    
    @IBOutlet weak var projTitle: UITextField!
    
    @IBOutlet weak var projDeadline: UIDatePicker!
    
    let user = CurrentUser()
    
    @IBAction func submitProj(_ sender: Any) {
        let dbRef = Database.database().reference()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.A"
        let dateString = dateFormatter.string(from: projDeadline.date)
        let postDict: [String:AnyObject] = ["projectTitle": self.projTitle.text as AnyObject,
                                            "projDescription" : self.projDescription.text as AnyObject,
                                            "username": user.username as AnyObject,
                                            "deadline": dateString as AnyObject,]
        let key = dbRef.child(firProjNode).childByAutoId().key
        let childUpdates = ["/\(firProjNode)/\(key)": postDict]
        dbRef.updateChildValues(childUpdates)
        performSegue(withIdentifier: "projToMain", sender: sender)
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


