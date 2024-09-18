//
//  CategoryView.swift
//  Category
//
//  Created by Merve Sena on 18.09.2024.
//

import SwiftUI

struct CategoryView: View {
    @State private var selectedCategory: String?
    @State private var rotationDegrees: Double = 0

    let categories = ["Car", "Home", "Shopping", "Health"]

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.9), Color.gray.opacity(0.7)]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                ForEach(0..<2) { row in
                    HStack(spacing: 20) {
                        ForEach(0..<2) { column in
                            let index = row * 2 + column
                            categoryItem(category: categories[index])
                                .onTapGesture {
                                    withAnimation(.easeInOut) {
                                        selectedCategory = categories[index]
                                        rotationDegrees += 360
                                    }
                                }
                        }
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    private func categoryItem(category: String) -> some View {
        ZStack {
            if selectedCategory == category {
                Text(category)
                    .foregroundColor(.white)
                    .font(.system(size: 22))
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
                    .rotationEffect(.degrees(rotationDegrees))
                    .frame(width: 170, height: 170)
            } else {
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.white.opacity(0.5))
                    .frame(width: 170, height: 170)
                    .overlay(
                        Text(category.prefix(1))
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    )
            }
        }
    }
}

#Preview {
    CategoryView()
}

