//
//  Post.swift
//  Instagram
//
//  Created by Shaurya Sinha on 04/02/18.
//  Copyright © 2018 Shaurya Sinha. All rights reserved.
//

import UIKit
import FirebaseDatabase

class Post{
    var key: String?
    let imageURL : String
    let imageHeight: CGFloat
    let creationDate : Date
    
    var dictValue: [String : Any] {
        let createdAgo = creationDate.timeIntervalSince1970
        
        return ["image_url" : imageURL,
                "image_height" : imageHeight,
                "created_at" : createdAgo]
    }
    
    init(imageURL: String, imageHeight: CGFloat){
        self.imageURL = imageURL
        self.creationDate = Date()
        self.imageHeight = imageHeight
    }
    
    init?(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String : Any],
            let imageURL = dict["image_url"] as? String,
            let imageHeight = dict["image_height"] as? CGFloat,
            let createdAgo = dict["created_at"] as? TimeInterval
            else { return nil }
        
        self.key = snapshot.key
        self.imageURL = imageURL
        self.imageHeight = imageHeight
        self.creationDate = Date(timeIntervalSince1970: createdAgo)
    }
    
    
}
