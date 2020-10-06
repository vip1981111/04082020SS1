//
//  AdObject.swift
//  04082020SS1
//
//  Created by Mohammed Abdullah on 07/02/1442 AH.
//  Copyright © 1442 Mohammed Abdullah. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore

class AdObject {
    var ID : String?
    var Stamp: TimeInterval?
    var ImageURL : String?
    var ProductID :String?
    
    init(ID : String,  Stamp: TimeInterval,  ProductID : String, ImageURL : String){
        
        self.ID = ID
        self.Stamp = Stamp
        self.ProductID = ProductID
        self.ImageURL = ImageURL
    }
    init(Dictionary : [String : AnyObject]){
        
         self.ID = Dictionary["ID"] as? String
         self.Stamp = Dictionary["Stamp"] as? TimeInterval
         self.ProductID = Dictionary["ProductID"] as? String
         self.ImageURL = Dictionary["ImageURL"] as? String
    }
    
    func MakeDictionary() -> [String : AnyObject] {
        var D : [String : AnyObject] = [:]
         D["ID"] = self.ID as AnyObject
         D["Stamp"] = self.Stamp as AnyObject
         D["ProductID"] = self.ProductID as AnyObject
         D["ImageURL"] = self.ImageURL as AnyObject
        return D
    }
    
    func Upload(){
        
            guard let id = self.ID else {return}
               
               Firestore.firestore().collection("Ads").document(id).setData(MakeDictionary())
               
        
        
    }
    
    func Remove(){
           
           guard let id = self.ID else {return}
                         
        Firestore.firestore().collection("Ads").document(id).delete()
           
           
       }
       
    
}

class AdApi {
    
    static func Get(ID: String,completion: @escaping(_ AD : AdObject)->()){
        
        Firestore.firestore().collection("Ads").document(ID).addSnapshotListener { (Snapshot:DocumentSnapshot?, Error: Error?) in
            if let data = Snapshot?.data() as [String:AnyObject]? {
                let New = AdObject(Dictionary: data)
                completion(New)
            }
        }
        
    }
    ///جلب كل البيانات من الفير بيس
    static func GetAllAds(completion : @escaping (_ AD : AdObject)->()){
        
        Firestore.firestore().collection("Ads").getDocuments { (Snapshot, error) in
            if error != nil { print("Error") ; return}
            guard let documents = Snapshot?.documents else {return}
            for P in documents {
                if let data = P.data() as [String:AnyObject]? {
                  let New = AdObject(Dictionary: data)
                               completion(New)
               }
                
            }
        }
        
    }
  
}
    

