//
//  Constants.swift
//  PhleekPhotos
//
//  Created by Patrick Reynolds on 2/1/16.
//  Copyright © 2016 Patrick Reynolds. All rights reserved.
//

import UIKit

struct Constants {
    static func headerViewHeight() -> CGFloat {
        return 50
    }
    
    static func accessToken() -> String {
        return ""
    }
    
    static func endpoint(tag tag: String) -> String {
        return "https://api.instagram.com/v1/tags/\(tag)/media/recent?access_token=\(accessToken())"
    }
    
    static func refreshControlAction() -> Selector {
        return Selector("handleRefreshControl:")
    }
    
    static func usernameFontColor() -> UIColor {
        return UIColor(hexString: "#125688")
    }
}
