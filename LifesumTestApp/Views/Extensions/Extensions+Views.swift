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
        //.font(Font.custom("AvenirLight", size: size ?? 14.0))
            .font(.system(size: size ?? 14.0))
            .foregroundColor(color ?? Color(red: 108/255, green: 108/255, blue: 108/255))
        //.frame( height: 19)
            .clipped()
            .multilineTextAlignment(.center)
            .lineLimit(1)
    }
    
    func customValueField(bodyText: Any?, color: Color? = nil, size: Double? = nil, percentage: Bool) -> some View {
        if let body = bodyText {
            return Text(String(describing: "\(body)\(percentage ? "%" : "")"))
                .foregroundColor(color)
                .font(.system(size: size ?? 14.0, weight: .regular, design: .default))
                //.frame(width: 99, height: 19)
                .clipped()
        }
        else {
            return Text("N/A")
                .foregroundColor(color)
                .font(.system(size: size ?? 14.0, weight: .regular, design: .default))
               // .frame(width: 99, height: 19)
                .clipped()
        }
        
    }
    

    
}
