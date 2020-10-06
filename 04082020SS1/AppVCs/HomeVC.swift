//
//  HomeVC.swift
//  04082020SS1
//
//  Created by Mohammed Abdullah on 18/12/1441 AH.
//  Copyright © 1441 Mohammed Abdullah. All rights reserved.
//

import UIKit

class HomeVC : UIViewController {
    
    
    @IBOutlet weak var CollectionView: UICollectionView!
    
    @IBOutlet weak var ProductCollectionView: UICollectionView!
    
    @IBOutlet weak var dealProductView: UICollectionView!
    
    
    
    
    
    
    
    
    
//    @IBOutlet weak var CollectionView: UICollectionView!
//
//    @IBOutlet weak var ProductCollectionView: UICollectionView!
//
//    @IBOutlet weak var dealProductView: UICollectionView!
    
    
    var ADArray : [AdObject] = []
//
    
    var ProuductArray : [ProductObject] = []
     var dealsArray : [String] = ["","","","","",""]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        SetUpCollectionView()
        GetData()

    }
    
    
    func GetData(){
        
        
        ProductApi.GetAllProducts { (Product) in
            self.ProuductArray.append(Product)
            self.ProductCollectionView.reloadData()
            print("GetAllProducts")
        }
        AdApi.GetAllAds { (Ad : AdObject) in
            
            self.ADArray.append(Ad)
            self.CollectionView.reloadData()
        }
        
    }
}

extension HomeVC : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
//    2
    func SetUpCollectionView () {
        
        CollectionView.delegate = self ; CollectionView.dataSource = self
        ProductCollectionView.delegate = self ; ProductCollectionView.dataSource = self
        dealProductView.delegate = self ; dealProductView.dataSource = self
        
        CollectionView.register( UINib ( nibName: "HomeAdCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        
        ProductCollectionView.register(UINib(nibName: "ProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
       
        dealProductView.register(UINib(nibName: "ProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        
        
     
        
    }
//    1
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView.tag == 0 {
             return CGSize(width: self.view.frame.width, height: 200)
            
        }else if collectionView.tag == 1 {
            
            return CGSize(width: collectionView.frame.size.height/1.7 , height: collectionView.frame.size.height)

        }else if collectionView.tag == 2 {
            
            return CGSize(width: collectionView.frame.size.height/1.7 , height: collectionView.frame.size.height)
        }
        
        return CGSize()
        
       
    }
//    3
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 0 {
            return ADArray.count
        }else if collectionView.tag  == 1 {
            
            return ProuductArray.count
            
        }else if collectionView.tag == 2 {
            return dealsArray.count
        }
        return 0
    }
//    4
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
       // 0
        if collectionView.tag == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! HomeAdCollectionViewCell
            cell.Update(AD: ADArray[indexPath.row])
            
                   
                   return cell
            
          // 1
        }else if collectionView.tag == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ProductCollectionViewCell
            cell.Update(produtut: ProuductArray[indexPath.row])
                  
                   return cell
            
            // 2
        }else if collectionView.tag == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ProductCollectionViewCell
                             
                    return cell
            
        }
        
        
       
        
        return UICollectionViewCell()
    }
    
    
    
    
    
    
    
}
