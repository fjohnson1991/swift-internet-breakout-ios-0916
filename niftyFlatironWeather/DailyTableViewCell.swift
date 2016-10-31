//
//  DailyTableViewCell.swift
//  niftyFlatironWeather
//
//  Created by Felicity Johnson on 10/29/16.
//  Copyright © 2016 Johann Kerr. All rights reserved.
//

import UIKit

class DailyTableViewCell: UITableViewCell {

    @IBOutlet weak var maxTempLabel: UILabel!
   
    @IBOutlet weak var minTempLabel: UILabel!
    
    @IBOutlet weak var dailySummaryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
