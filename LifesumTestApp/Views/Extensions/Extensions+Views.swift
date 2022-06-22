//
//  Extensions+Views.swift
//  LifesumTestApp
//
//  Created by Guglielmo Chimera on 22/06/22.
//

import SwiftUI

extension View {
    
    func customLabel(bodyText: String, color: Color? = nil, size: Double? = nil) -> some View {
        return Text(bodyText)
            .fixedSize(horizontal: false, vertical: true)
            .font(.system(size: size ?? 18.6))
            .foregroundColor(color ?? Color(red: 108/255, green: 108/255, blue: 108/255))
            .clipped()
            .multilineTextAlignment(.center)
            .lineLimit(1)
    }
    
    func customValueField(bodyText: Any?, color: Color? = nil, size: Double? = nil, percentage: Bool) -> some View {
        if let body = bodyText {
            return Text(String(describing: "\(body)\(percentage ? "%" : "")"))
                .foregroundColor(color)
                .font(.system(size: size ?? 18.6, weight: .regular, design: .default))
                .clipped()
        }
        else {
            return Text("")
                .foregroundColor(color)
                .font(.system(size: size ?? 18.6, weight: .regular, design: .default))
                .clipped()
        }
        
    }
    
    func customDivider(size: Double? = nil) -> some View {
        Divider()
            .frame(width: size ?? 80.7)
            .padding(.bottom, 1.0)
            .background(Color.white)
            .padding(.horizontal, 10.0)
    }
    
    
}
