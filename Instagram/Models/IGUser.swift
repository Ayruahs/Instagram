//
//  IGUser.swift
//  Instagram
//
//  Created by Shaurya Sinha on 04/02/18.
//  Copyright © 2018 Shaurya Sinha. All rights reserved.
//

import Foundation
import FirebaseDatabase.FIRDataSnapshot

class IGUser{
    let uid: String
    let username: String
    
    // MARK: - Init
    
    init(uid: String, username: String) {
        self.uid = uid
        self.username = username
    }
    
    init?(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String : Any],
            let username = dict["username"] as? String
            else { return nil }
        
        self.uid = snapshot.key
        self.username = username
    }
}
