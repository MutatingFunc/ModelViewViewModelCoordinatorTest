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

    var viewModel: DetailViewModelProtocol? {
        return self.firstResponder(ofType: DetailViewModelProtocol.self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        detailDescriptionLabel.text = viewModel?.object?.description
    }


}

