//
//  ContentView.swift
//  CalorieTracker
//
//  Created by SHAdON . on 10/17/24.
//

import SwiftUI

struct ContentView: View {
    
    // we actually create the instance of the foodList here
    // in the contentView screen
    @ObservedObject var foodList: FoodList = FoodList()
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(0...5, id: \.self) { value in
                        VStack(alignment: .leading) {
                            Text("Calories: 200")
                            Text("Food Eaten: Apple")
                        }
                    }
                }
            }
            .navigationTitle("Calorie App 🍔")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "plus.circle")
                        .foregroundStyle(.black)
                        .onTapGesture {
                            // show the add food view
                        }
                }
            }
        }
        
    }
}

// creata struct to hold the food details
struct Food: Equatable, Identifiable {
    var id = UUID()
    var name: String
    var calories: String
}

// use this as our data source for now!
class FoodList: ObservableObject {
    @Published var foods: [Food] = []
    @Published var showAddFoodView: Bool = false
    
    func addFood(food: Food) {
        foods.append(food)
    }
    
    func deleteFood(food: Food) {
        if let idx = foods.firstIndex(of: food) {
            foods.remove(at: idx)
        }
    }
}

#Preview {
    ContentView()
}
