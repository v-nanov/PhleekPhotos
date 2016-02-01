//
//  UIImageVIewExt.swift
//  PhleekPhotos
//
//  Created by Patrick Reynolds on 2/1/16.
//  Copyright © 2016 Patrick Reynolds. All rights reserved.
//

import UIKit

extension UIImageView {
    public func imageFromUrl(urlString: String, completion: ((data: NSData?) -> ())) {
        if let url = NSURL(string: urlString) {
            let request = NSURLRequest(URL: url)
            let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration(), delegate: nil, delegateQueue: NSOperationQueue.mainQueue())
            let task: NSURLSessionDataTask = session.dataTaskWithRequest(request) { data, response, error in
                completion(data: data)
                return
            }
            task.resume()
        }
        completion(data: nil)
    }
}
