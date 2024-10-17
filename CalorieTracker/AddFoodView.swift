//
//  AddFoodView.swift
//  CalorieTracker
//
//  Created by SHAdON . on 10/17/24.
//

import SwiftUI

struct AddFoodView: View {
    
    @ObservedObject var foodList: FoodList
    
    @State private var food: String = ""
    @State private var calorie: String = ""
    @State private var foodText: String = "Enter food..."
    @State private var calorieText: String = "Enter Calorie..."
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 300, height: 50)
                .shadow(color: .gray, radius: 2, x: 0, y: 2)
                .foregroundStyle(.white)
                .overlay {
                    TextField(calorieText, text: $calorie)
                        .autocorrectionDisabled()
                        .padding([.leading])
                }
            Spacer()
                .frame(height: 20)
            
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 300, height: 50)
                .shadow(color: .gray, radius: 2, x: 0, y: 2)
                .foregroundStyle(.white)
                .overlay {
                    TextField(foodText, text: $food)
                        .autocorrectionDisabled()
                        .padding([.leading])
                }
            
            Spacer()
                .frame(height: 20)
            
            Button {
                if !food.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    foodText = "You MUST enter a meal to continue"
                } else if !calorie.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    calorieText = "You MUST enter calories to continue"
                } else {
                    foodList.addFood(food: Food(name: food, calories: calorie))
                    foodList.showAddFoodView.toggle()
                }
            } label: {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 300, height: 50)
                    .foregroundStyle(.blue)
                    .overlay {
                        Text("Add Food")
                            .font(.title2)
                            .bold()
                            .foregroundStyle(.white)
                    }
            }
            Spacer()
        }
    }
}

#Preview {
    AddFoodView(foodList: FoodList())
}
