//
//  MatchesCollectionViewCell.swift
//  Sports App
//
//  Created by mac on 1/31/22.
//  Copyright © 2022 mac. All rights reserved.
//

import UIKit

class MatchesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var awayTeamNameLabel: UILabel!
    @IBOutlet weak var awayTeamImage: UIImageView!
    @IBOutlet weak var matchDateLabel: UILabel!
    @IBOutlet weak var matchTimeLabel: UILabel!
    @IBOutlet weak var homeTeamImage: UIImageView!
    @IBOutlet weak var homeTeamNameLabel: UILabel!
    var cornerRadius: CGFloat = 15
       
       override func awakeFromNib() {
           super.awakeFromNib()
           
           // Apply rounded corners to contentView
           contentView.layer.cornerRadius = cornerRadius
           contentView.layer.masksToBounds = true
           
           // Set masks to bounds to false to avoid the shadow
           // from being clipped to the corner radius
           layer.cornerRadius = cornerRadius
           layer.masksToBounds = false
           
       }
       
       override func layoutSubviews() {
           super.layoutSubviews()
           
           // Improve scrolling performance with an explicit shadowPath
           layer.shadowPath = UIBezierPath(
               roundedRect: bounds,
               cornerRadius: cornerRadius
           ).cgPath
       }
}
