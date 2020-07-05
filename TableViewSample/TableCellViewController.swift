//
//  TableCellViewController.swift
//  TableViewSample
//
//  Created by Kap's on 15/06/20.
//  Copyright © 2020 Kapil. All rights reserved.
//

import UIKit

protocol tableCellDelegate {
    
    func didTapWatchLater(title : String)
    func didTapWatchNow(url : String)
}

class TableCellViewController: UITableViewCell {

    @IBOutlet weak var videoImageView: UIImageView!
    @IBOutlet weak var videoTitle: UILabel!
    
    var videoItem : Video!
    var cellDelegate : tableCellDelegate?
    
    func setVideo(video : Video) {
        
        videoItem = video
        videoImageView.image = video.image
        videoTitle.text = video.title
    }
    
    @IBAction func watchLaterTapped(_ sender: Any) {
        cellDelegate?.didTapWatchLater(title: videoItem.title)
    }
    
    @IBAction func watchNowtapped(_ sender: Any) {
        cellDelegate?.didTapWatchNow(url: videoItem.url)
    }
    
    
}
