//
//  RecipeDetailViewController.swift
//  iOS Recipes
//
//  Created by Seschwan on 5/22/19.
//  Copyright © 2019 Seschwan. All rights reserved.
//

import UIKit

class RecipeDetailViewController: UIViewController {
    
    // Variables
    var recipe: Recipe? {
        didSet {
            updateViews()
        }
    }
    
    
    // Outlets
    @IBOutlet weak var recipeLbl: UILabel!
    @IBOutlet weak var recipeDetailView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()

        // Do any additional setup after loading the view.
    }
    
    
    func updateViews() {
        if self.isViewLoaded {
            recipeLbl.text = recipe?.name
            recipeDetailView.text = recipe?.instructions
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
