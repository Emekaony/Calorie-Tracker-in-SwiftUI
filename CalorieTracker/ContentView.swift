//
//  ContentView.swift
//  CalorieTracker
//
//  Created by SHAdON . on 10/17/24.
//

import SwiftUI

struct ContentView: View {
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

#Preview {
    ContentView()
}
