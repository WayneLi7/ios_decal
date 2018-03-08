//
//  ImageDisplayController.swift
//  Snapchat Clone
//
//  Created by weili on 3/7/18.
//  Copyright © 2018 org.iosdecal. All rights reserved.
//

import Foundation
import UIKit

class ImageDisplayController : UIViewController{
    var imageToDisplay : UIImage!
    @IBOutlet weak var imageDisplaying: UIImageView!
    
    func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        //let tappedImage = tapGestureRecognizer.view as! UIImageView
        performSegue(withIdentifier: "unwindToFeed", sender: self)
        // Your action
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageDisplaying.image = imageToDisplay
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imageDisplaying.isUserInteractionEnabled = true
        imageDisplaying.addGestureRecognizer(tapGestureRecognizer)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
