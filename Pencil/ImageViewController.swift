//
//  ImageViewController.swift
//  Pencil
//
//  Created by M_AMBIN02825 on 22/09/23.
//

import UIKit
import PencilKit
import PhotosUI

class ImageViewController: UIViewController {
    
    var img = UIImage()
    @IBOutlet weak var capturedImage: UIImageView!
    
    @IBOutlet weak var saveToGallery: UIBarButtonItem!
    @IBAction func saveToGallery(_ sender: Any) {
        UIGraphicsBeginImageContextWithOptions(capturedImage.bounds.size, false, UIScreen.main.scale)
        capturedImage.drawHierarchy(in: capturedImage.bounds, afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        if image != nil {
            PHPhotoLibrary.shared().performChanges({
                PHAssetChangeRequest.creationRequestForAsset(from: image!)
            }, completionHandler: { success, error in
                
            })
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        capturedImage.image = img
    }
}
