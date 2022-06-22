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
        
        VStack(alignment: .center, spacing: 90.0) {
            Circle()
                .fill(
                    // gradient circular color
                    LinearGradient(colors: [orangeGradient,redGradient], startPoint: .leading, endPoint: .bottomTrailing)
                )
                // specic sizes as per documentation
                .frame(maxWidth: 362.1, maxHeight: 362.1)
                .clipped()
                .shadow(color: Color(.tertiaryLabel).opacity(0.5), radius: 8, x: 0, y: 8)
            
                .overlay(Group {
                    VStack {
                        customValueField(bodyText: $viewModel.results.wrappedValue.response?.title, color: .white, percentage: false)
                        
                        customDivider(size: 100.1)
                        
                        customValueField(bodyText: $viewModel.results.wrappedValue.response?.calories, color: .white, size: 40.0, percentage: false)
                            .padding(.top, 10.0)
                        
                        customLabel(bodyText: "Calories per serving", color: .white).italic()
                    }
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
                        let _ = viewModel.performRequest()
                    }
                    // handle error request within alert
                    .alert("\($viewModel.alertText.wrappedValue ?? "unknown error")! \n an error occured with Food id \(String(describing: $viewModel.foodId.wrappedValue)) request, please try again", isPresented: $viewModel.alert) {
                        Button("OK", role: .cancel) { }
                    }
                }, alignment: .center)
        }
        .padding(.horizontal, 60)
    }
}

