//
//  PhleekPhotoTableViewCell.swift
//  PhleekPhotos
//
//  Created by Patrick Reynolds on 1/31/16.
//  Copyright © 2016 Patrick Reynolds. All rights reserved.
//

import UIKit

class PhleekPhotoTableViewCell: UITableViewCell {

    @IBOutlet weak var phleekUsernameLabel: UILabel!
    @IBOutlet weak var phleekUserProfileImageView: UIImageView!
    @IBOutlet weak var phleekImageView: UIImageView!
    @IBOutlet weak var loadingSpinner: UIActivityIndicatorView!
    
    @IBOutlet weak var phleekImageViewHeightConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func prepare(photo: PhleekPhoto) {
        
        phleekUsernameLabel.textColor = Constants.usernameFontColor()
        phleekUsernameLabel.text = photo.username
        
        if let urlString = photo.url {
            self.loadingSpinner.startAnimating()
            self.phleekImageView.imageFromUrl(urlString) { data in
                if let data = data {
                    self.loadingSpinner.stopAnimating()
                    self.phleekImageView.image = UIImage(data: data)
                }
            }
        }
        
        if let profilePicUrlString = photo.userProfileUrl {
            self.phleekUserProfileImageView.imageFromUrl(profilePicUrlString) { data in
                if let data = data {
                    self.phleekUserProfileImageView.image = UIImage(data: data)
                }
            }
        }
    }
    
    func setImageViewHeight(height: CGFloat) {
        phleekImageViewHeightConstraint.constant = height
    }
}
