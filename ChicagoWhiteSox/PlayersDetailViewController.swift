//
//  DetailViewController.swift
//  ChicagoWhiteSox
//
//  Created by Naga Praveen Kumar Pendyala on 11/3/15.
//  Copyright (c) 2015 Naga Praveen Kumar Pendyala. All rights reserved.
//

import UIKit

class PlayersDetailViewController: UIViewController {


    @IBOutlet weak var name: UILabel!

    @IBOutlet weak var number: UILabel!

    
    @IBOutlet weak var batsThrows: UILabel!
    
    @IBOutlet weak var height: UILabel!
    
    @IBOutlet weak var weight: UILabel!
    
    @IBOutlet weak var dob: UILabel!
    
        let imageProvider = ImageProvider()
    
    @IBOutlet weak var imageLabel: UIImageView!
    var detailItem: Player? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail: Player = self.detailItem {
            if let label = self.name {
                label.text = "\(detail.lname), \(detail.fname)"
            }
            
            if let label = self.number{
                label.text = "\(detail.number) | \(detail.position)"
                imageProvider.imageWithName("\(detail.number).jpg") {
                    (image: UIImage) in
                    // set the image in the detail view controller
                    self.imageLabel.image = image
                }
            }
            
            if let label = self.batsThrows{
                label.text = "\(detail.bats) / \(detail.throws)"
            }
            
            if let label = self.height{
                label.text = detail.height
            }
            
            if let label = self.weight{
                label.text = "\(detail.weight) lbs."
            }
            
            if let label = self.dob{
                label.text = detail.dob
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

