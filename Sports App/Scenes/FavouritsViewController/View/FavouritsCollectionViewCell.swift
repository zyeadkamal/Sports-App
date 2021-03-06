//
//  FavouritsCollectionViewCell.swift
//  Sports App
//
//  Created by mac on 1/30/22.
//  Copyright © 2022 mac. All rights reserved.
//

import UIKit

class FavouritsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var favouritsImage: UIImageView!
    @IBOutlet weak var favouritsLabel: UILabel!
    var leagueVideoButtonPressed : (() -> Void)?
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
    
    @IBAction func youtubeButtonPressed(_ sender: UIButton) {
        
        leagueVideoButtonPressed?()
    }
    func configure(_ obj : FavoriteLeague)
    {
        setLeagueImage(imgPath: obj.strBadge ?? "")
        setLeagueLabel(leagueName: obj.strLeague ?? "")
    }
    func setLeagueImage(imgPath : String)
    {
        let imgUrl = URL(string: imgPath)
        favouritsImage.kf.setImage(with: imgUrl)
    }
    func setLeagueLabel(leagueName : String)
    {
        favouritsLabel.text = leagueName
    }
   
}
