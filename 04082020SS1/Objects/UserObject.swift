//
//  UserObject.swift
//  04082020SS1
//
//  Created by Mohammed Abdullah on 25/12/1441 AH.
//  Copyright © 1441 Mohammed Abdullah. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore
class UserObject {
    
    var ID : String?
    var Stamp : TimeInterval?
    
    var Name : String?
    var Age : Int?
    var Ismale: Bool?
    
    init(ID : String , Stamp : TimeInterval , Name : String , Age : Int , Ismale : Bool) {
        self.ID = ID
        self.Stamp = Stamp
        self.Name = Name
        self.Age = Age
        self.Ismale = Ismale
        
    }
    init(Dictionary:[String:AnyObject]) {
        self.ID = Dictionary["ID"] as? String
        self.Stamp = Dictionary["Stamp"] as? TimeInterval
        self.Name = Dictionary["Name"] as? String
        self.Age = Dictionary["Age"] as? Int
        self.Ismale = Dictionary["Ismale"] as? Bool
        
    }
    
    func MakeDictioary() -> [String:AnyObject] {
        var New : [String:AnyObject] = [:]
        New["ID"] = self.ID as AnyObject
        New["Stamp"] = self.Stamp as AnyObject
        New["Name"] = self.Name as AnyObject
        New["Age"] = self.Age as AnyObject
        New["Ismale"] = self.Ismale as AnyObject
        return New
    }
    
    
    func Upload()  {
        
        guard let id = self.ID else {return}
        
        Firestore.firestore().collection("Users").document(id).setData(MakeDictioary())
        
    }
    
    
}
/// هو الوحيد اللذي لديه القدره على جلب البيانات من قاعدة البيانات     UserApi class
class UserApi {
    
    static func GeUser(ID: String, completion: @escaping(_ User: UserObject)->()){
        
        Firestore.firestore().collection("Users").document(ID).addSnapshotListener { (Snapshot:DocumentSnapshot?, Error: Error?) in
            if let data = Snapshot?.data() as [String:AnyObject]? {
                
                let New = UserObject(Dictionary: data)
                completion(New)
            }
        }
        
        
        
    }
    
    
    
    
    
    
    
}
