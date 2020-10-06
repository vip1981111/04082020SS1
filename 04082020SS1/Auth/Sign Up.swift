//
//  Sign Up.swift
//  04082020SS1
//
//  Created by Mohammed Abdullah on 15/12/1441 AH.
//  Copyright © 1441 Mohammed Abdullah. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore
class SignUp : UIViewController {
    
    
    @IBOutlet weak var EmailTextFiled: UITextField!
    @IBOutlet weak var PasswordTextFiled: UITextField!
    @IBOutlet weak var ConfirmTextFiled: UITextField!
    
    @IBAction func signUpButton(_ sender: Any) {
        
        if PasswordTextFiled.text != ConfirmTextFiled.text {return}
            
            Auth.auth().createUser(withEmail: EmailTextFiled.text!, password: PasswordTextFiled.text!) { (auth, error) in
                if error == nil {
                     print("creat user Up")
                    
                    Auth.auth().addStateDidChangeListener { (auth, user) in
                    guard let User = user else {return}
                    print(User.uid)
                        Firestore.firestore().collection("Users").document(User.uid).setData(["Email" :self.EmailTextFiled.text!])
                    
                   
               
                
                           
                    }
                    
                    self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
                    
                }else{
                    
                    print(error.debugDescription)
                }
                   }
            
        }
    
    @IBAction func signIn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
       
}
    
    
    
    

