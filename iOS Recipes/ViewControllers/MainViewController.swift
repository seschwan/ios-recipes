//
//  ViewController.swift
//  iOS Recipes
//
//  Created by Seschwan on 5/21/19.
//  Copyright © 2019 Seschwan. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    // Constants
    let networkClient = RecipesNetworkClient()
    
    // Variables
    var allRecipes: [Recipe] = [] {
        didSet {
            self.filterRecipes()
        }
    }
    var recipesTableViewController: RecipiesTableViewController? {
        didSet {
           recipesTableViewController?.recipes = filteredRecipes
        }
    }
    var filteredRecipes: [Recipe] = [] {
        didSet {
            recipesTableViewController?.recipes = filteredRecipes
        }
    }

    // Outlets
    @IBOutlet weak var searchTxtField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkClient.fetchRecipes { (allRecipes, error) in
            if let error = error {
                print("There was an error loading all recipes: \(error)")
                return
            }
            DispatchQueue.main.async {
                self.allRecipes = allRecipes!
            }
            
        }
        
    }

    @IBAction func searchAction(_ sender: UITextField) {
        resignFirstResponder()
        filterRecipes()
    }
    
    func filterRecipes() {
        
        // Checking to make sure text field is not empty.
        guard let searchTxt = searchTxtField.text, !searchTxt.isEmpty else {
            filteredRecipes = allRecipes
            return
        }
        // Filtering the results
        let results = allRecipes.filter { ($0.name.contains(searchTxt)) || ($0.instructions.contains(searchTxt))}
        filteredRecipes = results
    }
    
}

extension MainViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTableViewSegue" {
            recipesTableViewController = segue.destination as? RecipiesTableViewController
            
        }
        
    }
}
