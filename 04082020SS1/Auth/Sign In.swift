//
//  Sign In.swift
//  04082020SS1
//
//  Created by Mohammed Abdullah on 15/12/1441 AH.
//  Copyright © 1441 Mohammed Abdullah. All rights reserved.
//

import UIKit
import Firebase

class SignIn : UIViewController,UIScrollViewDelegate{
    
    
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView){


        self.view.endEditing(true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SettingUpKeyboardNotificaions()
    }
    @IBOutlet weak var buttomLayout: NSLayoutConstraint!
    @IBOutlet weak var EmailTextFiled: UITextField!
    @IBOutlet weak var PasswordTextFiled: UITextField!
    
    @IBAction func SignInButton(_ sender: UIButton) {
        Auth.auth().signIn(withEmail: self.EmailTextFiled.text!, password: self.PasswordTextFiled.text!) { (auth, error) in
            
            if error == nil {
                
                print("sign in OK")
                self.dismiss(animated: true, completion: nil)
                
            }else {
                
                print(error.debugDescription)
            }
            
            
            
        }


    }
    
    
}

// Keyboard
extension SignIn {

    func SettingUpKeyboardNotificaions(){

        NotificationCenter.default.addObserver(self, selector: #selector(SignIn.KeyboardShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(SignIn.KeyboardHid(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }


    @objc func KeyboardShow(notification : NSNotification) {

        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {

            UIView.animate(withDuration: 0.3, delay: 0, options: [], animations: {
                self.buttomLayout.constant = keyboardSize.height
                self.view.layoutIfNeeded()
                }, completion: nil)

        }

    }

    @objc func KeyboardHid(notification : NSNotification) {

        UIView.animate(withDuration: 0.3, delay: 0, options: [], animations: {
            self.buttomLayout.constant = 0
            self.view.layoutIfNeeded()
            }, completion: nil)
//
    }


}

