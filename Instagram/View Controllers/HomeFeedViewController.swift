//
//  HomeFeedViewController.swift
//  Instagram
//
//  Created by Shaurya Sinha on 29/01/18.
//  Copyright © 2018 Shaurya Sinha. All rights reserved.
//

import UIKit
import FirebaseAuth

class HomeFeedViewController: UIViewController {

    @IBAction func logOut(_ sender: Any) {
        print("logout pressed")
        do
        {
            try Auth.auth().signOut()
            self.dismiss(animated: true, completion: nil)
           // let storyboard = UIStoryboard(name: "Main", bundle: nil)
            //let IntroVC = storyboard.instantiateViewController(withIdentifier: "loginScreen") as! LoginViewController
            //let appDelegate = UIApplication.shared.delegate as! AppDelegate
            //appDelegate.window?.rootViewController = IntroVC
        }
        catch let error as NSError
        {
            print(error.localizedDescription)
        }

        //NotificationCenter.default.post(name: NSNotification.Name("didLogout"), object: nil)
    }
    @IBAction func cameraTapped(_ sender: Any) {
        print("camera pressed")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
