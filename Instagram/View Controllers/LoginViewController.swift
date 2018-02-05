//
//  LoginViewController.swift
//  Instagram
//
//  Created by Shaurya Sinha on 29/01/18.
//  Copyright © 2018 Shaurya Sinha. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var usernameField: UITextField!    
    
    @IBAction func onSignIn(_ sender: Any) {
        let email = usernameField.text
        let password = passwordField.text
        
        Auth.auth().signIn(withEmail: email!, password: password!) { (user, error) in
            if let error = error{
                print(error.localizedDescription)
            }else{
                self.performSegue(withIdentifier: "loginSegue"){
                    
                }
            }
        }
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        let email = usernameField.text
        let password = passwordField.text
        
        print(email!)
        
        Auth.auth().createUser(withEmail: email!, password: password!) { (user, error) in
            if let error = error {
                print(error.localizedDescription)
            }else{
                self.performSegue(withIdentifier: "loginSegue"){
                    
                }
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setGradientBackground()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let user = Auth.auth().currentUser
        
        print(user?.email)
        
        if user != nil{
            self.performSegue(withIdentifier: "loginSegue"){
                
            }
        }else{
            print("No user logged in")
        }
    }
    
    func setGradientBackground() {
        let colorTop =  UIColor(red: 250.0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 255.0/255.0, green: 0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [ colorTop, colorBottom]
        gradientLayer.locations = [ 0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
