//
//  HourlyTableViewCell.swift
//  niftyFlatironWeather
//
//  Created by Felicity Johnson on 10/29/16.
//  Copyright © 2016 Johann Kerr. All rights reserved.
//

import UIKit

class HourlyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var tempLabel: UILabel!
    
    @IBOutlet weak var summaryLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
