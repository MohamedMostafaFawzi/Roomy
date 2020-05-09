//
//  AddRoomViewController.swift
//  Roomy
//
//  Created by Mohamed Canaria on 4/29/20.
//  Copyright © 2020 Mohamed Mostafa Fawzi. All rights reserved.
//

import UIKit
//
// MARK: - AddRoomViewController
//
class AddRoomViewController: UIViewController {
    //
    // MARK: - IBOutlets
    //
    @IBOutlet weak var roomTitle: UITextField!
    @IBOutlet weak var roomPlace: UITextField!
    @IBOutlet weak var roomPrice: UITextField!
    @IBOutlet weak var roomDescription: UITextField!
    @IBOutlet weak var roomImage: UIImageView!
    
    var pickedImage:UIImage? {
        didSet{
            roomImage.image = pickedImage
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

    }
    //
    // MARK: - IBAction
    //
    @IBAction func chooseImage(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        picker.delegate = self
        self.present(picker, animated: true, completion: nil)
    }
    
    
    @IBAction func addTheRoom(_ sender: Any) {
        
        guard let roomTitle = self.roomTitle.text else { return }
        guard let roomPlace = self.roomPlace.text else { return }
        guard let roomPrice = self.roomPrice.text else { return }
        guard let roomDescription = self.roomDescription.text else { return }
        let roomImage = self.roomImage.image
        
        
        Request.addRoom(title: roomTitle, place: roomPlace, price: roomPrice, description: roomDescription, image: roomImage) { response in
            switch response{
            case .success(_ ):
                let homeTableViewController = UIStoryboard(name: "Main", bundle : nil).instantiateViewController(identifier: "HomeTableViewController" ) as! HomeTableViewController
                self.navigationController?.pushViewController(homeTableViewController, animated: true)
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }

}
//
// MARK: - UIImagePickerControllerDelegate, UINavigationControllerDelegate
//
extension AddRoomViewController : UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            self.pickedImage = editedImage
            } else if let editedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
                self.pickedImage = editedImage
            }

    }
}
