//
//  TicketResumeTableViewCell.swift
//  cine-app
//
//  Created by Alejandro Mendoza on 17/10/19.
//  Copyright © 2019 Alejandro Mendoza. All rights reserved.
//

import UIKit

class TicketResumeTableViewCell: UITableViewCell {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var kidsTicketsLabel: UILabel!
    @IBOutlet weak var adultTicketsLabel: UILabel!
    @IBOutlet weak var movieNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
