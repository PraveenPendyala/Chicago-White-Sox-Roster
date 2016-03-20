//
//  PlayerCell.swift
//  ChicagoWhiteSox
//
//  Created by Naga Praveen Kumar Pendyala on 11/3/15.
//  Copyright (c) 2015 Naga Praveen Kumar Pendyala. All rights reserved.
//

import UIKit

class PlayerCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var noposLabel: UILabel!
    @IBOutlet weak var playerImageView: UIImageView!
    //adding values to the labels in the cell
    var player: Player!{
        didSet {
            nameLabel.text = "\(player.lname) \(player.fname)"
            noposLabel.text = "\(player.number) | \(player.position)"
        }
        
    }
    
}
