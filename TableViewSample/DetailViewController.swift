//
//  DetailViewController.swift
//  TableViewSample
//
//  Created by Kap's on 15/06/20.
//  Copyright © 2020 Kapil. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var videoImage: UIImageView!
    @IBOutlet weak var videoTitle: UILabel!
    @IBOutlet weak var videoURL: UILabel!
    
    var video : Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.videoImage.image = video?.image
        self.videoTitle.text  = video?.title
        self.videoURL.text = video?.url
    }
}
