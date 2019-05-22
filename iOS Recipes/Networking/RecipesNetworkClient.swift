//
//  RecipesNetworkClient.swift
//  iOS Recipes
//
//  Created by Seschwan on 5/21/19.
//  Copyright © 2019 Seschwan. All rights reserved.
//

import Foundation

struct RecipesNetworkClient {
    
    static let recipesURL = URL(string: "https://lambdacookbook.vapor.cloud/recipes")!
    
    func fetchRecipes(completion: @escaping ([Recipe]?, Error?) -> Void) {
        URLSession.shared.dataTask(with: RecipesNetworkClient.recipesURL) { (data, _, error) in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                completion(nil, NSError())
                return
            }
            
            do {
                let recipes = try JSONDecoder().decode([Recipe].self, from: data)
                completion(recipes, nil)
            } catch {
                completion(nil, error)
                return
            }
        }.resume()
    }
}
