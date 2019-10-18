//
//  CandyTableViewCell.swift
//  cine-app
//
//  Created by Alejandro Mendoza on 17/10/19.
//  Copyright © 2019 Alejandro Mendoza. All rights reserved.
//

import UIKit

class CandyTableViewCell: UITableViewCell {

    @IBOutlet weak var candyName: UILabel!
    @IBOutlet weak var numberOfCandies: UILabel!
    @IBOutlet weak var candyPriceLabel: UILabel!
    @IBOutlet weak var candyImageView: UIImageView!
    
    var candies: Int = 0 {
        willSet {
            numberOfCandies.text = "\(newValue)"
        }
    }
    
    var candyIndex: Int = 0
    
    var delegate: CandyChangedValueDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func didSelectNewNumberOfCandies(_ sender: UIStepper) {
        candies = Int(sender.value)
        
        guard let delegate = delegate else { return }
        
        delegate.candyChangedQuantityTo(Int(sender.value), index: candyIndex)
    }
    
}
