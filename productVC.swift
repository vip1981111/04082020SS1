//
//  productVC.swift
//  04082020SS1
//
//  Created by Mohammed Abdullah on 15/02/1442 AH.
//  Copyright © 1442 Mohammed Abdullah. All rights reserved.
//

import UIKit
class productVC : UIViewController {
   
    
    
    var Product : ProductObject!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.TitleLabel.text = Product.Name
        self.DescriptionLabel.text = Product.Description
        self.CounterLabel.text = "1"
        self.PriceLabel.text = (Product.Price?.description ?? "") + "$"
        
        
    }
    
    
    @IBOutlet weak var CollectionView: UICollectionView!{ didSet { CollectionView.delegate = self ; CollectionView.dataSource = self}}
    
    @IBOutlet weak var TitleLabel: UILabel!
    
    @IBOutlet weak var DescriptionLabel: UILabel!
    
    @IBAction func IncreaseButtonAction(_ sender: Any) {
    }
    
    @IBAction func DecreaseButtonAction(_ sender: Any) {
    }
    @IBOutlet weak var CounterLabel: UILabel!
    
    @IBOutlet weak var PriceLabel: UILabel!
    
    @IBAction func OrderButtonAction(_ sender: Any) {
    }
}

extension productVC : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.Product.ImageURL?.count ?? 0   }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
       return cell
    }
    
    
    
}
