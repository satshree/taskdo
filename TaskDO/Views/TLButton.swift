//
//  TLButton.swift
//  TaskDO
//
//  Created by Satshree Shrestha on 7/24/24.
//

import SwiftUI

struct TLButton: View {
    @State var title: String
    @State var background: Color = .blue
    @State var textColor: Color = .white
    @State var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 7)
                    .foregroundColor(background)
                
                Text(title)
                    .foregroundColor(textColor)
                    .bold()
            }
        }
    }
}

#Preview {
    TLButton(title: "Value") {
        print("Clicked")
    }
}
