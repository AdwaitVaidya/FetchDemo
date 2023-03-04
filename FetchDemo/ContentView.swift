//
//  ContentView.swift
//  Fetch_APP
//
//  Created by Adwait Vaidya on 3/3/23.
//

import SwiftUI
import CoreData


struct Meal: Codable, Hashable {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String

}

struct MealsResponse: Codable {
    let meals: [Meal]
    
    init(from decoder: Decoder) throws {
         let container = try decoder.container(keyedBy: CodingKeys.self)
         meals = try container.decode([Meal].self, forKey: .meals)
     }
}

struct ContentView: View {
    //@Environment(\.managedObjectContext) var moc
    //@FetchRequest(sortDescriptors: []) var meals: FetchedResults<Meal>
    
    
    @State private var meals_Listed = [Meal]()
    //private let meals: [Meal]
    @State private var path: [Meal] = []
    
    var body: some View {
        if #available(iOS 16, *) {
            NavigationStack(path: $path){
                List(meals_Listed, id:\.idMeal) { item in
                    NavigationLink(destination: RecipieView(trail: item)) {
                        SwiftUIView(trail: item)
                    }
                }
                .task {
                    await loadData()
                }
                .navigationTitle("Recipies")
            }
            .navigationDestination(for: Meal.self){
                item in RecipieView(trail: item)
            }
        } else {
            NavigationView {
                List(meals_Listed, id:\.idMeal) { item in
                    NavigationLink(destination: RecipieView(trail: item)) {
                        SwiftUIView(trail: item)
                    }
                }
                .task {
                    await loadData()
                }
                .navigationTitle("Recipies")
            }
        }
    }
    
    func loadData() async {
        let apiUrl = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
        guard let url = URL(string: apiUrl) else {
            print("Error: invalid URL")
            return
        }
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }

            guard let httpResponse = response as? HTTPURLResponse else {
                print("Invalid response")
                return
            }

            if httpResponse.statusCode == 200, let data = data {
                do {
                    let decoder = JSONDecoder()
                    let mealsResponse = try decoder.decode(MealsResponse.self, from: data)
                    meals_Listed = mealsResponse.meals
                   // let Meals = MealsEntity(context: moc)
                    
                    //print(Recipes.meals[10].thumbnailURL)
                    //print("JSON Response: \(json)")
                } catch {
                    print("Error parsing JSON: \(error.localizedDescription)")
                }
            } else {
                print("Invalid response code: \(httpResponse.statusCode)")
            }
        }
        task.resume()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()// recipe: Recipes() )
    }
}
