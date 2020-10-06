//
//  StaringVC.swift
//  04082020SS1
//
//  Created by Mohammed Abdullah on 17/12/1441 AH.
//  Copyright © 1441 Mohammed Abdullah. All rights reserved.
//

import UIKit
import Firebase

class StaringVC : UIViewController {
    
    
   
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if user == nil {
                self.performSegue(withIdentifier: "Auth", sender: nil)
                
            }else {
                
                self.performSegue(withIdentifier: "App", sender: nil)
            }
        }
    }

    
}
