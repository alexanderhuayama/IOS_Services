//
//  SongCell.swift
//  DemoRestServices
//
//  Created by Docente801 on 1/06/17.
//  Copyright © 2017 Francisco Sanchez. All rights reserved.
//

import UIKit
import SDWebImage



class SongCell: UICollectionViewCell {
    
    @IBOutlet weak var imgCell: UIImageView!
    
    @IBOutlet weak var lblName: UILabel!
    
    var songData: Dictionary<String, AnyObject>!
    
    func initCell(){
        
        let url = self.songData["artworkUrl100"] as! String
    
        self.imgCell.sd_setImage(with: URL(string: url))
        
        let name = self.songData["trackName"] as! String
        
        self.lblName.text = name
    
    }
    
}
