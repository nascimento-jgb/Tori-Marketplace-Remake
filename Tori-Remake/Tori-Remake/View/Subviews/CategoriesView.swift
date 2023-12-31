//
//  CategoriesView.swift
//  Tori-Remake
//
//  Created by Joao Nascimento on 13.8.2023.
//

import SwiftUI

struct CategoriesView: View {
    
    @ObservedObject var viewModel: MainMenuViewModel
    
    var body: some View {
        
        ScrollView(.horizontal)
        {
            LazyHStack(spacing: 15){
                ForEach(Category.allCases, id: \.self) { category in
                    if let imageHolder = categoryImages[category] {
                        VStack{
                            Button(action: {
                                viewModel.categoryStatus = category.rawValue
                            }){
                                Image(imageHolder)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 90, height: 90)
                                    .padding(.bottom, 2)
                            }
                            
                            Text(category.rawValue.capitalized)
                                .customFont(.headline)
                                .foregroundColor(.black)
                                .font(.caption)
                        }
                    }
                }
            }
            .padding(.leading, 5)
            .padding()
        }
        .frame(height: 130)
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        let dummyViewModel = MainMenuViewModel()
        
        CategoriesView(viewModel: dummyViewModel)
    }
}
