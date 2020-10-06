//
//  XUpload.swift
//  04082020SS1
//
//  Created by Mohammed Abdullah on 11/02/1442 AH.
//  Copyright © 1442 Mohammed Abdullah. All rights reserved.
//

import UIKit
import Firebase
class XUpload {
    
    static func UploadImage(Image : UIImage, completion : @escaping (_ url : String)->()){
    guard let dataImg = Image.pngData() else {return}
    
    let storage = Storage.storage().reference()
    let imagesRef = storage.child("images").child(UUID().uuidString)
    //meta هي تحديد نوعية الصورة
    imagesRef.putData(dataImg, metadata: nil) { (meta, error) in
    imagesRef.downloadURL { (url, error) in
        guard let str = url?.absoluteString else {return}
        completion(str)
    }
    }
}
    
}
extension UIImage {
    
    func Upload(completion:@escaping (_ url : String)->()){
        XUpload.UploadImage(Image: self.resizeImage(image: self, targetSize: CGSize(width: 500, height: 500))) { (Url) in completion(Url)  }
    }
    
//    تصغير حجم الصور للرفع السريع
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }

    
}
