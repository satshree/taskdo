//
//  HeaderView.swift
//  TaskDO
//
//  Created by Satshree Shrestha on 7/24/24.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subTitle: String
    
    var body: some View {
        ZStack {

            VStack {
                Text(title)
                    .font(.system(size: 50))
                    .bold()
                
                Text(subTitle)
                    .font(.system(size: 25))
                    .padding(.top, 10)
                    .padding(.bottom, 10)
            }
            .padding(.top, 50)
            
        }
        .frame(width: UIScreen.main.bounds.width, height: 300)
//        .offset(y: -100)
    }
}

#Preview {
    HeaderView(
        title: "Title",
        subTitle: "Subtitle"
    )
}
