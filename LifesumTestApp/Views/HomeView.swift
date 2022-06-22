//
//  HomeView.swift
//  LifesumTestApp
//
//  Created by Guglielmo Chimera on 21/06/22.
//

import Foundation
import SwiftUI

struct HomeView: View {
    
    @StateObject private var viewModel = HomeViewModel()

    var body: some View {
        
        VStack(spacing: 90) {
            Circle()
                .fill(
                    LinearGradient(colors: [Color(red: 243/255, green: 167/255, blue: 78/255),Color(red: 237/255, green: 84/255, blue: 96/255)], startPoint: .leading, endPoint: .bottomTrailing)
                )
                .frame(width: 271, height: 271)
                .clipped()
                .foregroundColor(Color.red)
                .shadow(color: Color(.tertiaryLabel).opacity(0.5), radius: 8, x: 0, y: 8)
            
                .overlay(Group {
                    VStack {
                        customValueField(bodyText: $viewModel.results.wrappedValue.response?.title, color: .white, size: 18.0, percentage: false)
                        Divider()
                            .padding(.bottom, 1.0)
                            .background(Color.white)
                        
                        customValueField(bodyText: $viewModel.results.wrappedValue.response?.calories, color: .white, size: 40.0, percentage: false)
                            .padding(.top, 10.0)
                        
                        customLabel(bodyText: "Calories per serving", color: .white).italic()
                    }
                    .padding(.horizontal, 60)
                }, alignment: .center)
            HStack {
                VStack {
                    customLabel(bodyText: "CARBS")
                    Divider()
                    customValueField(bodyText: $viewModel.results.wrappedValue.response?.carbs, percentage: true)
                }
                VStack {
                    customLabel(bodyText: "PROTEIN")
                    Divider()
                    customValueField(bodyText: $viewModel.results.wrappedValue.response?.protein, percentage: true)
                    
                }
                VStack {
                    customLabel(bodyText: "FAT")
                    Divider()
                    customValueField(bodyText: $viewModel.results.wrappedValue.response?.fat, percentage: true)
                }
            }
            Capsule(style: .continuous)
                .frame(width: 287, height: 75)
                .clipped()
                .shadow(color: Color(.sRGBLinear, red: 0/255, green: 0/255, blue: 0/255).opacity(0.5), radius: 8, x: 0, y: 6)
                .overlay(Group {
                    customLabel(bodyText: "MORE INFO", color: .white).onTapGesture {
                        viewModel.performRequest()
                    }
                    .alert("Food details not found, please try again", isPresented: $viewModel.alert) {
                                Button("OK", role: .cancel) { }
                            }
                }, alignment: .center)
        }
        .padding(.all, 60)
    }
    
    
    
    
}

