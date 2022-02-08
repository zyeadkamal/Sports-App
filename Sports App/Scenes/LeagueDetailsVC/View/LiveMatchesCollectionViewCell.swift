//
//  LiveMatchesCollectionViewCell.swift
//  Sports App
//
//  Created by mac on 1/30/22.
//  Copyright © 2022 mac. All rights reserved.
//

import UIKit

class LiveMatchesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var awayTeamScoreLabel: UILabel!
    @IBOutlet weak var awayTeamNameLebel: UILabel!
    @IBOutlet weak var awayTeamImage: UIImageView!
    @IBOutlet weak var scoreView: UIView!
    
    @IBOutlet weak var hometeamScoreLabel: UILabel!
    @IBOutlet weak var homeTeamNameLabel: UILabel!
    @IBOutlet weak var homeTeamIamge: UIImageView!
    @IBOutlet weak var leagueNameLabel: UILabel!
    var cornerRadius: CGFloat = 15
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Apply rounded corners to contentView
        contentView.layer.cornerRadius = cornerRadius
        contentView.layer.masksToBounds = true
        
        scoreView.layer.cornerRadius = 25
        scoreView.layer.masksToBounds = true
        
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
