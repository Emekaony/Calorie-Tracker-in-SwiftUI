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
    @State private var showDeleteAlert: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(foodList.foods, id: \.id) { food in
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Calories: \(food.calories)")
                                Text("Food Eaten: \(food.name)")
                            }
                            Spacer()
                            Image(systemName: "trash")
                                .foregroundStyle(.red)
                                .onTapGesture {
                                    showDeleteAlert.toggle()
                                }
                                .alert("Are you sure you want to delete this item?", isPresented: $showDeleteAlert) {
                                    Button("yes", role: .destructive) {
                                        // delete it
                                        foodList.deleteFood(food: food)
                                        showDeleteAlert.toggle()
                                    }
                                    Button("No", role: .cancel) {
                                        showDeleteAlert.toggle()
                                    }
                                }
                            
                        }
                        
                    }
                }
            }
            .navigationTitle("Calorie App 🍔")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        foodList.showAddFoodView.toggle()
                    } label: {
                        Image(systemName: "plus.circle")
                            .foregroundStyle(.black)
                    }
                    
                }
            }
            .sheet(isPresented: $foodList.showAddFoodView) {
                AddFoodView(foodList: foodList)
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
