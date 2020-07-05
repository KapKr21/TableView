//
//  TableHolderViewController.swift
//  TableViewSample
//
//  Created by Kap's on 15/06/20.
//  Copyright © 2020 Kapil. All rights reserved.
//

import UIKit
import SafariServices

class TableHolderViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var videosArray : [Video] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        videosArray =  createDataArray()
        addNavBarImage()
        
    }
    
    func addNavBarImage() {
        
        let navController = navigationController!
        
        let bannerWidth = navController.navigationBar.frame.size.width
        let bannnerHeight = navController.navigationBar.frame.size.height
        
        let image = UIImage(named: "navImage")
        let navImageView = UIImageView(image: image)
        
        let bannerX = bannerWidth / 2 - (image?.size.width)! / 2
        let bannerY = bannnerHeight / 2 - (image?.size.height)! / 2
        
        navImageView.frame = CGRect(x: bannerX, y: bannerY, width: bannerWidth, height: bannnerHeight)
        navImageView.contentMode = .scaleAspectFit
        
        navigationItem.titleView = navImageView
    }
    
    func createDataArray() -> [Video] {
        
        var videos : [Video] = []
        
        let video1 = Video(image: UIImage(named: "Image1")!,url: "https://www.youtube.com/watch?v=bLkuu_fmlsU", title: "First Video")
        let video2 = Video(image: UIImage(named: "Image2")!,url: "https://www.youtube.com/watch?v=Fi0Ip7Nkp60", title: "2nd Video")
        let video3 = Video(image: UIImage(named: "Image3")!,url: "https://www.youtube.com/watch?v=ZiYx_4eeOms", title: "3rd Video")
        let video4 = Video(image: UIImage(named: "Image4")!,url: "https://www.youtube.com/watch?v=ObIxxHy8yY8", title: "4th Video")
        let video5 = Video(image: UIImage(named: "Image5")!,url: "https://www.youtube.com/watch?v=FtO5QT2D_H8", title: "5th Video")
        let video6 = Video(image: UIImage(named: "Image5")!,url: "https://www.youtube.com/watch?v=D04XGcXwLKI", title: "6th Video")
        
        videos.append(video1)
        videos.append(video2)
        videos.append(video3)
        videos.append(video4)
        videos.append(video5)
        videos.append(video6)
        
        return videos
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "MasterVC" {
            
            let detailVC = segue.destination as! DetailViewController
            detailVC.video = sender as? Video
        }
    }
}

extension TableHolderViewController : tableCellDelegate {
    
    func didTapWatchLater(title: String) {
        
        let alertTitle = "Watch Later"
        let message    =  "\(title) was added to watch later list."
        
        let alert = UIAlertController(title: alertTitle, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    func didTapWatchNow(url: String) {
        
        let videoURL = URL(string: url)!
        let safariVC = SFSafariViewController(url: videoURL)
        present(safariVC, animated: true, completion: nil)
    }
}

extension TableHolderViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videosArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let video = videosArray[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? TableCellViewController
        cell?.setVideo(video: video)
        cell?.cellDelegate = self
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let video = videosArray[indexPath.row]
        
//        let url : URL! = URL(string: video.url)
//
//        let safariVC = SFSafariViewController.init(url: url)
//        present(safariVC, animated: true, completion: nil)
        
        performSegue(withIdentifier: "MasterVC", sender: video)
    }
}
