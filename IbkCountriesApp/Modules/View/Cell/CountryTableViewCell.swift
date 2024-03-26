//
//  CountryTableViewCell.swift
//  IbkCountriesApp
//
//  Created by Marco Antonio  on 25/03/2024.
//

import UIKit
import Kingfisher

class CountryTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var flagImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension CountryTableViewCell {
    
    func setupCell(name: String?, flag: String?) {
        
        self.nameLabel.text = name ?? ""
        
        if let url = URL(string: flag!) {
            
            self.flagImage.kf.setImage(with: url, options: [.transition(.fade(0.5))])
        }
    }
}
