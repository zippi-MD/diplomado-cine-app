//
//  MovieTableViewCell.swift
//  cine-app
//
//  Created by Alejandro Mendoza on 15/10/19.
//  Copyright © 2019 Alejandro Mendoza. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    @IBOutlet weak var viewFunctions: UIButton!
    
    var delegate: roomSelectedDelegate?
    
    var room: CinemaRoom?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func seeFunctions(_ sender: Any) {
        guard let room = room else {return}
        delegate?.wasSelectedWithRoom(room)
    }
    
}
