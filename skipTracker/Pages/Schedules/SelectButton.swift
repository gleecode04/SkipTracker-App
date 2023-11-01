//
//  SelectButton.swift
//  skipTracker
//
//  Created by Anson Goo, Daniel Lee on 10/14/23.
//

import Foundation
import SwiftUI

struct SelectButton: View {
    @Binding var isSelected: Bool
    @State var color: Color
    @State var text: String
    
    var body: some View{
        
        ZStack{
            RoundedRectangle(cornerRadius: 4)
                .frame(width: 55, height: 35)
                .foregroundColor(isSelected ? color : .gray)
            Text(text)
                .foregroundColor(.white)
        }
        .padding(.horizontal, 2)
        
    }
}

#Preview{
    SelectButton(isSelected: .constant(false), color: .blue, text: "M")
}
