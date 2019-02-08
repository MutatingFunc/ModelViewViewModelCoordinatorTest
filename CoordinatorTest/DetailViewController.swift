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

    var viewModel: DetailViewModel? {
        didSet {
            self.viewModelResponder = viewModel
        }
    }
    
    func setup(detailViewModel: DetailViewModel?) {
        self.viewModel = detailViewModel
        
        guard self.isViewLoaded else { return }
        
        // Update the user interface for the detail item.
        detailDescriptionLabel.text = detailViewModel?.object?.description
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setup(detailViewModel: viewModel)
    }


}

