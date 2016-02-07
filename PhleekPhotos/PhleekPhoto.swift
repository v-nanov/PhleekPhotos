//
//  PhleekPhoto.swift
//  PhleekPhotos
//
//  Created by Patrick Reynolds on 2/1/16.
//  Copyright © 2016 Patrick Reynolds. All rights reserved.
//

import Foundation

import Argo
import Curry

struct PhleekPhoto {
    let url: String?
    let username: String?
    let userProfileUrl: String?
}

extension PhleekPhoto: Decodable {
    static func decode(j: JSON) -> Decoded<PhleekPhoto> {
        return curry(PhleekPhoto.init)
            <^> j <|? ["images", "standard_resolution", "url"]
            <*> j <|? ["user", "username"]
            <*> j <|? ["user", "profile_picture"]
    }
}

//struct PhleekPhoto {
//    
//    var url: String?
//    var username: String?
//    var userProfileUrl: String?
//    
//    init(data: [String:AnyObject]) {
//        if let images = data["images"] as? [String:AnyObject] {
//            if let low_res = images["low_resolution"] as? [String:AnyObject] {
//                if let url = low_res["url"] as? String {
//                    self.url = url
//                }
//            }
//        }
//
//        if let user = data["user"] as? [String:AnyObject] {
//            if let username = user["username"] as? String {
//                self.username = username
//            }
//        }
//        
//        if let user = data["user"] as? [String:AnyObject] {
//            if let userProfileUrl = user["profile_picture"] as? String {
//                self.userProfileUrl = userProfileUrl
//            }
//        }
//    }
//}
