//
//  PhleekPhotoTableViewCell.swift
//  PhleekPhotos
//
//  Created by Patrick Reynolds on 1/31/16.
//  Copyright © 2016 Patrick Reynolds. All rights reserved.
//

import UIKit

class PhleekPhotoTableViewCell: UITableViewCell {

    @IBOutlet private weak var phleekUsernameLabel: UILabel!
    @IBOutlet private weak var phleekUserProfileImageView: UIImageViewAsync!
    @IBOutlet private weak var phleekImageView: UIImageViewAsync!
    
    @IBOutlet private weak var phleekImageViewHeightConstraint: NSLayoutConstraint!
    
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
            self.phleekImageView.setImageFromUrl(url: urlString)
        }
        
        if let profilePicUrlString = photo.userProfileUrl {
            self.phleekUserProfileImageView.setImageFromUrl(url: profilePicUrlString)
        }
    }
    
    func setImageViewHeight(height: CGFloat) {
        phleekImageViewHeightConstraint.constant = height
    }
}
