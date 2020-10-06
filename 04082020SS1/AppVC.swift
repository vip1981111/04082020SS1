//
//  AppVC.swift
//  04082020SS1
//
//  Created by Mohammed Abdullah on 17/12/1441 AH.
//  Copyright © 1441 Mohammed Abdullah. All rights reserved.
//

import UIKit
import Firebase
class AppVC: UIViewController {
    
    @IBAction func signOut(_ sender: UIButton) {
        
          print("signOut")
         try? Auth.auth().signOut()
        self.dismiss(animated: true, completion: nil)
    }
    
    
//    print("signOut")
//         try? Auth.auth().signOut()
//
}
