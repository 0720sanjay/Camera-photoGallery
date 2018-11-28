//
//  ViewController.swift
//  Camera&photoGallery
//
//  Created by Lalit Arya on 28/11/18.
//  Copyright © 2018 Lalit Arya. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func actionPlzClick(_ sender: Any) {
        
        let picker = UIImagePickerController()
        picker.delegate = self
        
        let alert = UIAlertController(title: "primo", message: "Take photo", preferredStyle: .actionSheet)
        
        let btnCamera = UIAlertAction(title: "Camera", style: .default) { (UIAlertAction) in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                picker.sourceType = .camera
                self.present(picker,animated: true,completion: nil)
            }else{
                print("Sanjay ka kamera")
            }
        }
        
        let btnGalery = UIAlertAction(title: "Galery", style: .default) { (UIAlertAction) in
            picker.sourceType = .photoLibrary
            self.present(picker,animated: true,completion: nil)
        }
        
        alert.addAction(btnCamera)
        alert.addAction(btnGalery)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let gambar = info[.originalImage]
        imgView.image = (gambar as! UIImage)
        picker.dismiss(animated: true, completion: nil)
    }
    
    
}
