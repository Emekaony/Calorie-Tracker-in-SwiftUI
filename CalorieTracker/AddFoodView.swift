//
//  AddFoodView.swift
//  CalorieTracker
//
//  Created by SHAdON . on 10/17/24.
//

import SwiftUI

struct AddFoodView: View {
    
    @ObservedObject var foodList: FoodList
    
    var body: some View {
        Text("Hello world")
    }
}

#Preview {
    AddFoodView(foodList: FoodList())
}
