//
//  ComposeViewController.swift
//  Instagram
//
//  Created by Shaurya Sinha on 01/02/18.
//  Copyright © 2018 Shaurya Sinha. All rights reserved.
//

import UIKit
import CoreData

class ComposeViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    let imagePickerController = UIImagePickerController()

    @IBAction func onCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func onShare(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var uploadImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
    }
    
    @IBAction func onTap(_ sender: Any) {
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            uploadImageView.image = image
        }
        dismiss(animated: true, completion: nil)
    }
    
    
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
