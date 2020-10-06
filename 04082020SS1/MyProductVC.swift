//
//  MyProductVC.swift
//  04082020SS1
//
//  Created by Mohammed Abdullah on 07/02/1442 AH.
//  Copyright © 1442 Mohammed Abdullah. All rights reserved.
//

import UIKit

class MyProductVC :UIViewController {
    
    
    var Products : [ProductObject] = []
    
    
    
    
    @IBOutlet weak var CollectionView : UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CollectionView.delegate = self ; CollectionView.dataSource = self
        CollectionView.register( UINib(nibName: "ProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        
        getData() 
    }
    
    
    
    func getData() {
        
        ProductApi.GetAllProducts { (product : ProductObject) in
            self.Products.append(product)
            self.CollectionView.reloadData()
        }
        
    }
   
}


extension MyProductVC: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ProductCollectionViewCell
        cell.Update(produtut: self.Products[indexPath.row])
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width * 0.33 , height: collectionView.frame.size.width * 0.59)//0.33    0.55
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let SelectedProduct = Products[indexPath.row]
        
        performSegue(withIdentifier: "Next", sender: SelectedProduct)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let next = segue.destination as? AddNewProductVC {
            
            
            if let  product = sender as? ProductObject{
                next.EditingProduct = product
                
                
            }
            
            
            
        }
    }
    
}
