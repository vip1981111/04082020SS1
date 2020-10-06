//
//  AddNewProductVC.swift
//  04082020SS1
//
//  Created by Mohammed Abdullah on 29/12/1441 AH.
//  Copyright © 1441 Mohammed Abdullah. All rights reserved.
//

import UIKit
import BSImagePicker
import Photos
import FirebaseStorage

class AddNewProductVC : UIViewController {
   
    var Images : [UIImage] = []
    
    
    
   
    @IBOutlet weak var CollectionVeiew: UICollectionView! {didSet{CollectionVeiew.delegate = self ; CollectionVeiew.dataSource = self}}
    
    @IBAction func AdImageButtonAction(_ sender: Any) {
        
        
        presentImagePicker(imagePicker,animated: true,
              select: { (PHAsset : PHAsset) in
                  
                  
                  
              }, deselect: { (PHAsset : PHAsset) in
                  
              }, cancel: { (PHAsset : [PHAsset]) in
                  
              },finish:  { (PHAsset : [PHAsset]) in
                  
                  if PHAsset.count > 0 {
                      
                   let img = PHAsset[0]
                    self.AdImageView.image = getUIImage(asset: img)
                  }

                  
              },completion : nil)
     
    }
    
  
    var EditingProduct : ProductObject?
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView){


        self.view.endEditing(true)
    }
    
    let imagePicker = ImagePickerController()
//     var BSVC = ImagePickerController()
    
    override func viewDidLoad() {
           super.viewDidLoad()
        
        
        CollectionVeiew.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        
//          imagePicker.settings.selection.max = 5
        
        if let EditP = EditingProduct {
            
            self.Name.text = EditP.Name
            self.Description.text = EditP.Description
            self.Price.text = EditP.Price?.description
            self.Company.text = EditP.Company
            
//            if let str = EditP.ImageURL , let url = URL(string: str){
//                   self.ImageView.sd_setImage(with: url, completed: nil)
//
//            }
        }
       
        
           
    }
    
    
    @IBOutlet weak var AdImageView: UIImageView!
    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var Description: UITextView!
    @IBOutlet weak var Price: UITextField!
    @IBOutlet weak var Company: UITextField!
    
       
      
    
    @IBAction func UploadImage(_ sender: UIButton) {
        let imagePicker = ImagePickerController()
        imagePicker.settings.selection.max = 5
        presentImagePicker(imagePicker,animated: true,
        select: { (PHAsset : PHAsset) in
            
            
            
        }, deselect: { (PHAsset : PHAsset) in
            
        }, cancel: { (PHAsset : [PHAsset]) in
            
        },finish:  { (PHAsset : [PHAsset]) in
            
            for one in PHAsset {
                if let img = getUIImage(asset: one){
                    self.Images.append(img)
                    
                }
            }
            self.CollectionVeiew.reloadData()
            
        },completion : nil)
    }
  
    
    
    @IBAction func UploadProduct(_ sender: Any) {
        
//        self.ImageView.image?.Upload(completion: { (ImageURL: String) in
//            let ProductID : String = self.EditingProduct?.ID ?? UUID().uuidString
//            ProductObject(ID: ProductID, Stamp: Date().timeIntervalSince1970, Name: self.Name.text!, Description: self.Description.text!, Company: self.Company.text!, Price: Double(self.Price.text!) ?? 0.0, ImageURL: ImageURL).Upload()//هناك نوع من url والصورة من نوع string فلذالك نضيف absoluteString
//   
//                           print("Product Uploaded")
//            self.UploadADforProduct(ProductID: ProductID)
//            
//        })
    }
    
    
    func UploadADforProduct(ProductID : String){
        imagePicker.settings.selection.max = 1
        let imagePicker = ImagePickerController()
        self.AdImageView.image?.Upload(completion: { (ImageURL:String) in
//لم وضع  "AD" حتي يسهل البحث عنه وتم حذفها بس للتذكير
            AdObject(ID: ProductID , Stamp: Date().timeIntervalSince1970, ProductID: ProductID, ImageURL: ImageURL).Upload()
                print("Add Upload")
            
        })
    }
}



func getUIImage(asset: PHAsset) -> UIImage? {

    var img: UIImage?
    let manager = PHImageManager.default()
    let options = PHImageRequestOptions()
    options.version = .original
    options.isSynchronous = true
    
    manager.requestImageDataAndOrientation(for: asset, options: options) { (data, _, _, _) in
         if let data = data {
                 img = UIImage(data: data)
               
        }
       
    }
    return img
}




extension AddNewProductVC : UIScrollViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? ImageCollectionViewCell
        cell?.Update(Image: self.Images[indexPath.row])
        return cell!
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.height, height: collectionView.frame.size.height)
    }
    
    
    
    
    
    
    
    
}



//
