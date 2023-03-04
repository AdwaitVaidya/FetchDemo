//
//  RecipieView.swift
//  Fetch_APP
//
//  Created by Adwait Vaidya on 3/3/23.
//

import SwiftUI



struct MealDetailResponse: Codable{
    let meals: [MealDetail]
}
struct MeasureIngredients: Hashable, Codable, Identifiable{
    let ingredient: String
    let measure: String
    let id = UUID()
}

//                Text(trail.strMeal).font(.title)
//                Text(mealDetails.strArea)
//                VStack{
//                    Text("Ingredients")
//                    Text(String(ingredients.count))
//
//
//                    if(isExpanded){
//
//
//                    }
//                    else{
//
//                    }
//
//                    Button {
//                        isExpanded.toggle()
//                        print(isExpanded)
//                    } label: {
//                        Text("Show More")
//                    }
//                }
//
//                Text(mealDetails.strArea)


struct RecipieView: View {
    var trail: Meal
    @State private var meaIngr = [MeasureIngredients]()
    @State private var mealDetails: MealDetail = MealDetail.defaultMeal
    @State private var image: UIImage = UIImage(named: "defaultImage")!
    @State private var isIngredientsExpand = false
    @State private var isProcessExpand = false
    @State private var imageResizeExpand = false
    @State private var itemNum:Int = 1
    @State private var components:[String] = []
    
    
    var body: some View {
        if (!imageResizeExpand) {
            Image(uiImage: image)
                .resizable()
                .scaledToFit()
                .task {
                    await loadImg()
                }
                .task {
                    await loadData()
                }
        }
        else{
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                 .frame(width: 300, height: 100) // set the frame size to crop the image
                 .clipped()
        }
            
            
        Text(trail.strMeal).font(.title)
            Text("Ingredients")
            
            if(isIngredientsExpand){
                List(meaIngr) { item in
                                MeasureIngView(trail: item)}
                
//                ScrollView{
//
//                    ForEach(meaIngr) { item in
//                        MeasureIngView(trail: item)}
//                }
            }
            
            //
            
            else{
                
            }
            Button {
                isIngredientsExpand.toggle()
                print(isIngredientsExpand)
            } label: {
                isIngredientsExpand ?
                Text("Show Less") : Text("Show More")
            }
            
            Text("Process")
            if(isProcessExpand){
                
//                ScrollView{
//
//                    ForEach(components, id: \.self) { item in
//                        Text(item)}
//                }
//
                List(components, id: \.self) { item in
                    
                    Text(item)}


            }
            else{
                
            }
            Button {
                isProcessExpand.toggle()
                loadProcess()
                print(isProcessExpand)
            } label: {
                isProcessExpand ?
                Text("Show Less") : Text("Show More")
            }
        
    }
    
    func loadProcess(){
        components = mealDetails.strInstructions.components(separatedBy: "\n")
        print("pulled")
        print(mealDetails.strInstructions)
    }

    
    func loadData() async {
        print(trail.idMeal)
        let apiUrl = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(trail.idMeal)"
        guard let url = URL(string: apiUrl) else {
            print("Error: invalid URL")
            return
        }
        print(apiUrl)
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
                    print("Got to response")
                    print(data)
                    let mealsResponse = try decoder.decode(MealDetailResponse.self, from: data)
                    print("Got response")
                    mealDetails = mealsResponse.meals[0]
                    for i in 0..<mealDetails.ingredients.count {
                        if (mealDetails.ingredients[i] == "") {
                            continue
                        }
                        meaIngr.append(MeasureIngredients(ingredient: mealDetails.ingredients[i], measure: mealDetails.measures[i]))
                    }
                    print("asdadfjfgs")
                    //ingredients = mealDetails.ingredients
                    //print(ingredients)
                    
                    
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
    func loadImg() async {
        let apiUrl = trail.strMealThumb
        if let url = URL(string: apiUrl) {
            do {
                let imageData = try Data(contentsOf: url)
                let imageD = UIImage(data: imageData)
                image = imageD!
                // use the image
            } catch {
                print("Error getting image from URL: \(error)")
            }
        }
        
        
        
    }
    @ViewBuilder
    private func list() -> some View{
        
        
    }
    
}

struct RecipieView_Previews: PreviewProvider {
    static var previews: some View {
        RecipieView(trail: Meal(strMeal: "aaa", strMealThumb:  "defaultImage", idMeal: "53545"))// recipe: Recipes() )
    }
}
