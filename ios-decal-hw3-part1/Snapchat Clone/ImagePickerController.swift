//
//  imagePickerController.swift
//  snapChatProject
//
//  Created by Akilesh Bapu on 2/27/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

var imageSendToSender : UIImage!

// This class should remind you of lab 3. That's probably because it's exactly the same!
class ImagePickerController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet var imageCollectionView: UICollectionView!
    var imageSendToPreview: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageCollectionView.collectionViewLayout = ImageFlowLayout()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func unwindToPicker(segue:UIStoryboardSegue) {}


    func selectImage(_ image: UIImage) {
        //The image being selected is passed in as "image".
        imageSendToSender = image
        performSegue(withIdentifier: "PickerToSender", sender: imageCollectionView)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "PickerToSender" {
                if let dest = segue.destination as? ImageSenderController {
                    dest.imageToSend = imageSendToSender
                }
            }
        }
    }
    
    
    
    //DON'T MODIFY CODE HERE AND BELOW!
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pickImageCell", for: indexPath) as? ImageCollectionViewCell else {
            print("error dequeuing cell at index path \(indexPath)")
            return UICollectionViewCell()
        }
        cell.image.image = allImages[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let selectedCell = collectionView.cellForItem(at: indexPath) as? ImageCollectionViewCell {
            selectImage(selectedCell.image.image!)
        }
        
    }
}
