//
//  DetailViewController.swift
//  CoordinatorTest
//
//  Created by Froggatt, James on 31/01/2019.
//  Copyright © 2019 Froggatt, James. All rights reserved.
//

import UIKit

import Additions

class DetailViewController: UIViewController, StoryboardIdentifiable {

    @IBOutlet weak var detailDescriptionLabel: UILabel!

    
    var detailText: String?
    
    func setup(detailText: String?) {
        self.detailText = detailText
        
        guard self.isViewLoaded else { return }
        
        // Update the user interface for the detail item.
        detailDescriptionLabel.text = detailText
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setup(detailText: detailText)
    }


}

