//
//  ViewController.swift
//  imageView_blocking
//
//  Created by ac1ra on 24.05.2022.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate,UIScrollViewDelegate {
    @IBOutlet weak var button_txt: UIButton!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imagePicker.delegate = self
        self.scrollView.minimumZoomScale = 0.9
        self.scrollView.maximumZoomScale = 6.0
        self.imageView.contentMode = .center
        UIApplication.shared.isIdleTimerDisabled = true

    }

    @IBAction func loadImageBttnTapped(_ sender: UIButton){
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    @IBAction func bttn_lock(_ sender: Any) {
        
        if let button = sender as? UIButton{
        
            if scrollView.isUserInteractionEnabled == false, button.isSelected {
            scrollView.isUserInteractionEnabled = true
                button.isSelected = false
                button.setTitle("Unlock", for: .normal)
                button.setImage(UIImage(systemName: "lock.open"), for: .normal)
        } else {
            scrollView.isUserInteractionEnabled = false
            button.isSelected = true
            button.setTitle("Lock", for: .selected)
            button.setImage(UIImage(systemName: "lock"), for: .selected)
        }
    }
}
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
        imageView.contentMode = .scaleAspectFit
        imageView.image = pickedImage
        }
        dismiss(animated: true, completion: nil)
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
    
    @IBAction func light_bttn(_ sender: Any) {
        UIScreen.main.brightness = CGFloat(1.0)
    }
    @IBAction func left_bttn(_ sender: Any) {
        imageView.transform = imageView.transform.rotated(by: -(.pi / 2))
    }
    @IBAction func right_bttn(_ sender: Any) {
        imageView.transform = imageView.transform.rotated(by: .pi / 2)
    }
    
}
