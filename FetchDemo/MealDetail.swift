//
//  MealDetail.swift
//  FetchDemo
//
//  Created by Adwait Vaidya on 3/3/23.
//

import Foundation

struct MealDetail: Codable, Identifiable {
    let idMeal: String
    let strMeal: String
    let strDrinkAlternate: String?
    let strCategory: String
    let strArea: String
    let strInstructions: String
    let strMealThumb: String
    let strTags: String?
    let strYoutube: String
    let strIngredient1: String
    let strIngredient2: String
    let strIngredient3: String
    let strIngredient4: String
    let strIngredient5: String
    let strIngredient6: String
    let strIngredient7: String
    let strIngredient8: String
    let strIngredient9: String
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
    let strIngredient16: String?
    let strIngredient17: String?
    let strIngredient18: String?
    let strIngredient19: String?
    let strIngredient20: String?
    let strMeasure1: String
    let strMeasure2: String
    let strMeasure3: String
    let strMeasure4: String
    let strMeasure5: String
    let strMeasure6: String
    let strMeasure7: String
    let strMeasure8: String
    let strMeasure9: String
    let strMeasure10: String?
    let strMeasure11: String?
    let strMeasure12: String?
    let strMeasure13: String?
    let strMeasure14: String?
    let strMeasure15: String?
    let strMeasure16: String?
    let strMeasure17: String?
    let strMeasure18: String?
    let strMeasure19: String?
    let strMeasure20: String?
    let strSource: String?
    let strImageSource: String?
    let strCreativeCommonsConfirmed: String?
    let dateModified: String?
    
    var ingredients: [String] {
        return [strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5, strIngredient6, strIngredient7, strIngredient8, strIngredient9, strIngredient10, strIngredient11, strIngredient12, strIngredient13, strIngredient14, strIngredient15, strIngredient16, strIngredient17, strIngredient18, strIngredient19, strIngredient20].compactMap { $0 }
    }
    
    var measures: [String] {
        return [strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5, strMeasure6, strMeasure7, strMeasure8, strMeasure9, strMeasure10, strMeasure11, strMeasure12, strMeasure13, strMeasure14, strMeasure15, strMeasure16, strMeasure17, strMeasure18, strMeasure19, strMeasure20].compactMap { $0 }
    }
    
    var id: String {
        return idMeal
    }
    
        static let defaultMeal = MealDetail(idMeal: "",
                                       strMeal: "",
                                       strDrinkAlternate: "", // replace nil with ""
                                       strCategory: "",
                                       strArea: "",
                                       strInstructions: "",
                                       strMealThumb: "",
                                       strTags: "", // replace nil with ""
                                       strYoutube: "", // replace nil with ""
                                       strIngredient1: "", // replace nil with ""
                                       strIngredient2: "", // replace nil with ""
                                       strIngredient3: "", // replace nil with ""
                                       strIngredient4: "", // replace nil with ""
                                       strIngredient5: "", // replace nil with ""
                                       strIngredient6: "", // replace nil with ""
                                       strIngredient7: "", // replace nil with ""
                                       strIngredient8: "", // replace nil with ""
                                       strIngredient9: "", // replace nil with ""
                                       strIngredient10: "", // replace nil with ""
                                       strIngredient11: "", // replace nil with ""
                                       strIngredient12: "", // replace nil with ""
                                       strIngredient13: "", // replace nil with ""
                                       strIngredient14: "", // replace nil with ""
                                       strIngredient15: "", // replace nil with ""
                                       strIngredient16: "", // replace nil with ""
                                       strIngredient17: "", // replace nil with ""
                                       strIngredient18: "", // replace nil with ""
                                       strIngredient19: "", // replace nil with ""
                                       strIngredient20: "", // replace nil with ""
                                       strMeasure1: "", // replace nil with ""
                                       strMeasure2: "", // replace nil with ""
                                       strMeasure3: "", // replace nil with ""
                                       strMeasure4: "", // replace nil with ""
                                       strMeasure5: "", // replace nil with ""
                                       strMeasure6: "", // replace nil with ""
                                       strMeasure7: "", // replace nil with ""
                                       strMeasure8: "", // replace nil with ""
                                       strMeasure9: "", // replace nil with ""
                                       strMeasure10: "", // replace nil with ""
                                       strMeasure11: "", // replace nil with ""
                                       strMeasure12: "", // replace nil with ""
                                       strMeasure13: "", // replace nil with ""
                                       strMeasure14: "", // replace nil with ""
                                       strMeasure15: "", // replace nil with ""
                                       strMeasure16: "", // replace nil with ""
                                       strMeasure17: "", // replace nil with ""
                                       strMeasure18: "", // replace nil with ""
                                       strMeasure19: "", // replace nil with ""
                                       strMeasure20: "", // replace nil with ""
                                       strSource: "", // replace nil with ""
                                       strImageSource: "", // replace nil with ""
                                       strCreativeCommonsConfirmed: "", // replace nil with ""
                                       dateModified: "") // replace nil with ""
    
    
    
    
    
}
