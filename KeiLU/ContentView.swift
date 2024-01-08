//
//  ContentView.swift
//  KeiLU
//
//  Created by zhanybek salgarin on 1/5/24.
//

import SwiftUI

struct ContentView: View {
    let days = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    
    var body: some View {
        VStack{
            Image("myFace")
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 150)
                .clipShape(.capsule)
            
            Text("Marco Luciano")
                .font(.title)
                .bold()
            
            Rectangle()
                .frame(height: 1)
            
            Text("Select day")
                .font(.title2)
                .bold()
            
            HStack{
                Button {
                    print("something")
                } label: {
                    Image(systemName: "lessthan")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 16, height: 28)
                }
                
                Text("January 2024")
                    .font(.title2)
                    .padding([.leading, .trailing], 20)
                
                Button {
                    print("something")
                } label: {
                    Image(systemName: "greaterthan")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 16, height: 28)
                }
            }
            HStack {
                ForEach(days, id: \.self) { day in
                    Text(day)
                        .frame(maxWidth: .infinity)
                }
            }
            .padding(5)
        }
    }
}

#Preview {
    ContentView()
}
