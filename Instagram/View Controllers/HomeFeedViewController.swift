//
//  HomeFeedViewController.swift
//  Instagram
//
//  Created by Shaurya Sinha on 29/01/18.
//  Copyright © 2018 Shaurya Sinha. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseStorage
import Kingfisher

class HomeFeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var posts = [Post]()
    let storage = Storage.storage(url: "gs://instagramclone-3bdaf.appspot.com/")
    

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
        let refreshcontrol = UIRefreshControl()
        refreshcontrol.addTarget(self, action: #selector(refreshControlAction(_:)), for: UIControlEvents.valueChanged)
        tableView.insertSubview(refreshcontrol, at: 0)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 300
        tableView.rowHeight = UITableViewAutomaticDimension
        PostService.posts(for: Auth.auth().currentUser!) { (posts) in
            self.posts = posts
            self.tableView.reloadData()
        }
        
    }
    
    @objc func refreshControlAction(_ refreshControl: UIRefreshControl){
        PostService.posts(for: Auth.auth().currentUser!) { (posts) in
            self.posts = posts
            self.tableView.reloadData()
        }
        refreshControl.endRefreshing()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeFeed", for: indexPath) as! FeedCellTableViewCell
        
        let post = posts[indexPath.row]
        let imageURL = URL(string: post.imageURL)
        
        cell.userImageView.kf.setImage(with: imageURL)
        print("post image url: \(post.imageURL) | \(post.key)")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 320
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
