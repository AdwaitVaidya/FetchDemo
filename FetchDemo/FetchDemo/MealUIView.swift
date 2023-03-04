//
//  MealUI.swift
//  FetchDemo
//
//  Created by Adwait Vaidya on 3/3/23.
//

import SwiftUI

struct RecipeView: View {
    var trail: Meal
    var body: some View {
        VStack {
                    Text(trail.strMeal).font(.title)
                }
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView(trail: Meal(strMeal: "aaa", strMealThumb: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert", idMeal: "53545"))
    }
}
