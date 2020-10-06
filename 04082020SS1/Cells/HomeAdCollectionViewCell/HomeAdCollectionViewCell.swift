//
//  HomeAdCollectionViewCell.swift
//  04082020SS1
//
//  Created by Mohammed Abdullah on 18/12/1441 AH.
//  Copyright © 1441 Mohammed Abdullah. All rights reserved.
//

import UIKit
import SDWebImage
class HomeAdCollectionViewCell : UICollectionViewCell {

 
    @IBOutlet weak var ImageView: UIImageView!
    
    func Update(AD: AdObject) {
        
        if let str = AD.ImageURL , let url = URL(string : str) {
            
            ImageView.sd_setImage(with: url, completed: nil)
            self.ImageView.contentMode = .scaleAspectFill
        }
        
    }
    

}
