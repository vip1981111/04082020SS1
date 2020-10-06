//
//  ForgotPassword.swift
//  04082020SS1
//
//  Created by Mohammed Abdullah on 15/12/1441 AH.
//  Copyright © 1441 Mohammed Abdullah. All rights reserved.
//

import UIKit
import Firebase
class ForgotPassword : UIViewController {
    
    @IBOutlet weak var EmailTextFiled: UITextField!
    
    
    @IBAction func RestButton(_ sender: UIButton) {
        
        Auth.auth().sendPasswordReset(withEmail: EmailTextFiled.text!, completion: nil)
        print("send user to email")
    }
    
    @IBAction func signInButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
