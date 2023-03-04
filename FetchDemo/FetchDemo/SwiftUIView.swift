//
//  SwiftUIView.swift
//  FetchDemo
//
//  Created by Adwait Vaidya on 3/3/23.
//

import SwiftUI

struct SwiftUIView: View {
    var trail: Meal
    var body: some View {
        VStack {
                    Text(trail.strMeal).font(.title)
                }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView(trail: Meal(strMeal: "aaa", strMealThumb: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert", idMeal: "53545"))
    }
}
