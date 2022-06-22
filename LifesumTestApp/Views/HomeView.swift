//
//  HomeView.swift
//  LifesumTestApp
//
//  Created by Guglielmo Chimera on 21/06/22.
//

import Foundation
import SwiftUI

struct HomeView: View {
    
    // Circle colors
    let orangeGradient = Color(red: 243/255, green: 167/255, blue: 78/255)
    let redGradient = Color(red: 237/255, green: 84/255, blue: 96/255)
    
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        
        VStack() {
            Circle()
                .fill(
                    LinearGradient(colors: [orangeGradient,redGradient], startPoint: .leading, endPoint: .bottomTrailing)
                )
                .frame(width: 362.1, height: 362.1)
                .clipped()
                .shadow(color: Color(.tertiaryLabel).opacity(0.5), radius: 8, x: 0, y: 8)
                .animation(.easeOut(duration: 30.0), value: 30.0)
            
                .overlay(Group {
                    VStack {
                        customValueField(bodyText: $viewModel.results.wrappedValue.response?.title, color: .white, percentage: false)

                        customDivider(size: 100.1)
                        
                        customValueField(bodyText: $viewModel.results.wrappedValue.response?.calories, color: .white, size: 40.0, percentage: false)
                            .padding(.top, 10.0)
                        
                        customLabel(bodyText: "Calories per serving", color: .white).italic()
                    }
                    .padding(.horizontal, 60)
                }, alignment: .center)
            HStack(alignment: .center) {
                VStack {
                    customLabel(bodyText: "CARBS")
                    customDivider()
                    customValueField(bodyText: $viewModel.results.wrappedValue.response?.carbs, percentage: true)
                }
                VStack {
                    customLabel(bodyText: "PROTEIN")
                    customDivider()
                    customValueField(bodyText: $viewModel.results.wrappedValue.response?.protein, percentage: true)
                    
                }
                VStack {
                    customLabel(bodyText: "FAT")
                    customDivider()
                    customValueField(bodyText: $viewModel.results.wrappedValue.response?.fat, percentage: true)
                }
            }
            Capsule(style: .continuous)
                .frame(width: 287, height: 75)
                .clipped()
                .shadow(color: Color(.sRGBLinear, red: 0/255, green: 0/255, blue: 0/255).opacity(0.5), radius: 8, x: 0, y: 6)
                .overlay(Group {
                    customLabel(bodyText: "MORE INFO", color: .white).onTapGesture {
                        viewModel.performSearch()
                    }
                    .alert("Food id \(String(describing: $viewModel.foodId.wrappedValue)) details not found, please try again", isPresented: $viewModel.alert) {
                        Button("OK", role: .cancel) { }
                    }
                }, alignment: .center)
        }
        .frame(maxHeight: .infinity)
        //.padding(.horizontal, 60)
    }
    
    
    
    
}

