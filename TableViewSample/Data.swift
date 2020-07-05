//
//  Data.swift
//  TableViewSample
//
//  Created by Kap's on 15/06/20.
//  Copyright © 2020 Kapil. All rights reserved.
//

import Foundation
import UIKit

class Video {
    
    let image : UIImage!
    let url : String!
    let title : String!
    
    init(image : UIImage,url : String, title : String) {
        
        self.image = image
        self.url   = url
        self.title = title
    }
}
