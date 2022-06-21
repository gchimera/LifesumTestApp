//
//  ContentView.swift
//  LifesumTestApp
//
//  Created by Guglielmo Chimera on 20/06/22.
//

import SwiftUI

struct ContentView: View {
    
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
                            customLabel(bodyText: "CASHEWS", color: .white, size: 18.0)
                               
                            Divider()
                                .padding(.bottom, 1.0)
                                .background(Color.white)

                            customLabel(bodyText: "400", color: .white, size: 50.0)
                                .padding(.top, 10.0)

                            customLabel(bodyText: "Calories per serving", color: .white).italic()
                        }
                        .padding(.horizontal, 60)
                    }, alignment: .center)
                HStack {
                    VStack {
                        customLabel(bodyText: "CARBS")
                        Divider()
                        Text("%")
                            .foregroundColor(Color.secondary)
                            .font(.system(size: 14, weight: .regular, design: .default))
                            .frame(width: 99, height: 19)
                            .clipped()
                    }
                    VStack {
                        customLabel(bodyText: "PROTEIN")
                        Divider()
                        Text("%")
                            .foregroundColor(Color.secondary)
                            .font(.system(size: 14, weight: .regular, design: .default))
                            .frame(width: 99, height: 19)
                            .clipped()
                    }
                    VStack {
                        customLabel(bodyText: "FAT")
                        Divider()
                        Text("%")
                            .foregroundColor(Color.secondary)
                            .font(.system(size: 14, weight: .regular, design: .default))
                            .frame(width: 99, height: 19)
                            .clipped()
                    }
                }
                Capsule(style: .continuous)
                    .frame(width: 287, height: 75)
                    .clipped()
                    .shadow(color: Color(.sRGBLinear, red: 0/255, green: 0/255, blue: 0/255).opacity(0.5), radius: 8, x: 0, y: 6)
                    .overlay(Group {
                        customLabel(bodyText: "MORE INFO", color: .white)
                    }, alignment: .center)
            }
            .padding(.all, 60)
            
            
    
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
    func customLabel(bodyText: String, color: Color? = nil, size: Double? = nil, italic: Bool? = nil) -> some View {
        return Text(bodyText)
            .fixedSize(horizontal: false, vertical: true)
            //.font(Font.custom("AvenirLight", size: size ?? 14.0))
            .font(.system(size: size ?? 14.0))
            .foregroundColor(color ?? Color(red: 108/255, green: 108/255, blue: 108/255))
                //.frame( height: 19)
                .clipped()
                .multilineTextAlignment(.center)
                .lineLimit(1)
                
        
      
        
                

        }
}



