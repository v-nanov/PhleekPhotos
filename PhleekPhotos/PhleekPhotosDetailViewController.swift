//
//  PhleekPhotosDetailViewController.swift
//  PhleekPhotos
//
//  Created by Patrick Reynolds on 2/3/16.
//  Copyright © 2016 Patrick Reynolds. All rights reserved.
//

import UIKit

class PhleekPhotosDetailViewController: UIViewController {
    
    @IBOutlet private weak var phleekPhotoImageView: UIImageViewAsync!

    var photo: PhleekPhoto?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addDismissGesture()
        setupPhoto(photo)
    }
    
    private func addDismissGesture() {
        let tgr = UITapGestureRecognizer(target: self, action: Selector("dismissDetailView:"))
        tgr.delegate = self
        view.addGestureRecognizer(tgr)
    }
    
    private func setupPhoto(photo: PhleekPhoto?) {
        guard let url = photo?.url else {
            return
        }
        
        self.phleekPhotoImageView.setImageFromUrl(url: url)
    }
}

extension PhleekPhotosDetailViewController: UIGestureRecognizerDelegate {
    func dismissDetailView(sender: UITapGestureRecognizer) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
