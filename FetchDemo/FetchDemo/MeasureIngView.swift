//
//  MeasureIngView.swift
//  Fetch_APP
//
//  Created by Adwait Vaidya on 3/3/23.
//

import SwiftUI

struct MeasureIngView: View {
    var trail: MeasureIngredients
    var body: some View {
        HStack(alignment: .center) {
            
                Text(trail.ingredient)
                
                Text("|")
                
                Text(trail.measure)
            
            //Text("|")
        }
    }
}

struct MeasureIngView_Previews: PreviewProvider {
    static var previews: some View {
        MeasureIngView(trail: MeasureIngredients(ingredient: "", measure: ""))
    }
}
