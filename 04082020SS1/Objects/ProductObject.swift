//
//  ProductObject.swift
//  04082020SS1
//
//  Created by Mohammed Abdullah on 28/12/1441 AH.
//  Copyright © 1441 Mohammed Abdullah. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore

class ProductObject {
    var ID : String?
    var Stamp: TimeInterval?
    
    var Name : String?
    var Description : String?
    
    var Company : String?
    var Price : Double?
     var ImageURLs : [String]?
    
    init(ID : String,  Stamp: TimeInterval,  Name : String, Description : String, Company : String , Price : Double, ImageURLs : [String]){
        
        self.ID = ID
        self.Stamp = Stamp
        self.Name = Name
        self.Description = Description
        self.Company = Company
        self.Price = Price
         self.ImageURLs = ImageURLs
    }
    init(Dictionary : [String : AnyObject]){
        
         self.ID = Dictionary["ID"] as? String
         self.Stamp = Dictionary["Stamp"] as? TimeInterval
         self.Name = Dictionary["Name"] as? String
         self.Description = Dictionary["Description"] as? String
         self.Company = Dictionary["Company"] as? String
         self.Price = Dictionary["Price"] as? Double
         self.ImageURLs = Dictionary["ImageURLs"] as? [String]
    }
    
    func MakeDictionary() -> [String : AnyObject] {
        var D : [String : AnyObject] = [:]
         D["ID"] = self.ID as AnyObject
         D["Stamp"] = self.Stamp as AnyObject
         D["Name"] = self.Name as AnyObject
         D["Description"] = self.Description as AnyObject
         D["Company"] = self.Company as AnyObject
         D["Price"] = self.Price as AnyObject
        D["ImageURLs"] = self.ImageURLs as AnyObject
        return D
    }
    
    func Upload(){
        
            guard let id = self.ID else {return}
               
               Firestore.firestore().collection("Product").document(id).setData(MakeDictionary())
               
        
        
    }
    
    func Remove(){
           
           guard let id = self.ID else {return}
                         
        Firestore.firestore().collection("Product").document(id).delete()
           
           
       }
       
    
}

class ProductApi {
    
    static func GetProduct(ID: String,completion: @escaping(_ Product : ProductObject)->()){
        
        Firestore.firestore().collection("Product").document(ID).addSnapshotListener { (Snapshot:DocumentSnapshot?, Error: Error?) in
            if let data = Snapshot?.data() as [String:AnyObject]? { 
                let New = ProductObject(Dictionary: data)
                completion(New)
            }
        }
        
    }
    ///جلب كل البيانات من الفير بيس
    static func GetAllProducts(completion : @escaping (_ Product : ProductObject)->()){
        
        Firestore.firestore().collection("Product").getDocuments { (Snapshot, error) in
            if error != nil { print("Error") ; return}
            guard let documents = Snapshot?.documents else {return}
            for P in documents {
                if let data = P.data() as [String:AnyObject]? {
                  let New = ProductObject(Dictionary: data)
                               completion(New)
                           }
                
            }
        }
        
        
    
        
        
        
    }
    
    
    
}
    

