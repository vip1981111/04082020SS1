//
//  ProductCollectionViewCell.swift
//  04082020SS1
//
//  Created by Mohammed Abdullah on 19/12/1441 AH.
//  Copyright © 1441 Mohammed Abdullah. All rights reserved.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {

   
    
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var Price: UILabel!
    
    
    func Update(produtut: ProductObject){
        self.Name.text = produtut.Name
        self.Price.text = produtut.Price?.description 
        guard let imgString = produtut.ImageURLs?[0], let url = URL(string : imgString) else { return }
              ImageView.sd_setImage(with: url, completed: nil)
        
    }
    
    

}
