//
//  StorageReference+Post.swift
//  Instagram
//
//  Created by Shaurya Sinha on 04/02/18.
//  Copyright © 2018 Shaurya Sinha. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

extension StorageReference{
    static let dateFormatter = ISO8601DateFormatter()
    
    static func newPostImageReference() -> StorageReference {
        let uid = Auth.auth().currentUser?.uid
        let timestamp = dateFormatter.string(from: Date())
        
        return Storage.storage().reference().child("images/posts/\(uid)/\(timestamp).jpg")
    }
}
