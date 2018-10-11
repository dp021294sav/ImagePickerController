//
//  ViewController.swift
//  imagePickerController
//
//  Created by Андрей Сергиенко on 11.10.18.
//  Copyright © 2018 Андрей Сергиенко. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var imagePicker = UIImagePickerController()
    
    @IBOutlet private weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = #imageLiteral(resourceName: "Swift")
    }

    @IBAction func resetPressed(_ sender: Any) {
        imageView.image = #imageLiteral(resourceName: "Swift")
    }
    
    @IBAction func pickFromGalleryPressed(_ sender: Any) {
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        self.present(imagePicker, animated: true, completion: nil)
    }
    
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else {return}
        imageView.image = image
        dismiss(animated: true, completion: nil)
    }
}

