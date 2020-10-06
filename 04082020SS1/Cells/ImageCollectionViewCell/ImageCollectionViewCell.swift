//
//  ImageCollectionViewCell.swift
//  04082020SS1
//
//  Created by Mohammed Abdullah on 18/02/1442 AH.
//  Copyright © 1442 Mohammed Abdullah. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var ImageView: UIImageView!
    

    
    func Update(url:String) {
        guard let Url = URL(string: url) else { return }
        self.ImageView?.sd_setImage(with: Url, completed: nil)
        
        
        
    }
    
    func Update(Image:UIImage) {
        
        self.ImageView.image = Image
        
        
        
    }
    
    
}
