//
//  UIImageViewAsync.swift
//  PhleekPhotos
//
//  Created by Patrick Reynolds on 2/3/16.
//  Copyright © 2016 Patrick Reynolds. All rights reserved.
//

import UIKit

class UIImageViewAsync: UIImageView {
    
    // With activity indicator
    // With fade
    
    var activityIndecator: UIActivityIndicatorView?

    init() {
        super.init(frame: CGRectZero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setImageFromUrl(url urlString: String, withActivity: Bool, completion: ((set: Bool) -> ())? = nil) {
        if let url = NSURL(string: urlString) {
            if withActivity {
                activityIndecator = UIActivityIndicatorView(activityIndicatorStyle: .WhiteLarge)
                activityIndecator?.hidesWhenStopped = true
                self.addSubview(activityIndecator!)
                activityIndecator?.startAnimating()
            }
            let request = NSURLRequest(URL: url)
            let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration(), delegate: nil, delegateQueue: NSOperationQueue.mainQueue())
            let task: NSURLSessionDataTask = session.dataTaskWithRequest(request) { data, response, error in
                if let data = data {
                    self.image = UIImage(data: data)
                    if withActivity {
                        self.activityIndecator?.stopAnimating()
                    }
                    completion?(set: true)
                    return
                }
            }
            task.resume()
        }
        completion?(set: false)
    }
    
    func setImageFromUrl(url urlString: String, completion: ((set: Bool) -> ())? = nil) {
        self.setImageFromUrl(url: urlString, withActivity: false, completion: completion)
    }
}
