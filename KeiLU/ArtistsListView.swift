//
//  ArtistsListView.swift
//  KeiLU
//
//  Created by zhanybek salgarin on 2/1/24.
//

import SwiftUI

struct ArtistsListView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ZStack(alignment: .bottomLeading) {
                    Image("nailArtist")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: geometry.size.width)
                        .ignoresSafeArea()

                    VStack(alignment: .leading, spacing: 1) {
                        Text("HAIR/NAIL artist")
                            .fontWeight(.regular)
                            .foregroundStyle(.white)
                        Text("FanFan Tullip")
                            .font(.title3)
                            .bold()
                            .foregroundStyle(.white)
                        Text("At home, will travel")
                            .fontWeight(.regular)
                            .foregroundStyle(.white)
                    }
                    .padding(EdgeInsets(top: 16, leading: 24, bottom: 16, trailing: 24))
                    .background(Color.black.opacity(0.3))
                    .clipShape(.capsule)
                    .padding(EdgeInsets(top: 6, leading: 16, bottom: 6, trailing: 16))
                    
                }
                .frame(maxWidth: geometry.size.width, maxHeight: 300)
                
                HStack(spacing: 16) {
                    VStack {
                        Image(systemName: "text.bubble")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30, alignment: .center)
                        Text("Text")
                            .fontWeight(.regular)
                            .font(Font(CTFont.init(.label, size: 13)))
                    }
                    VStack {
                        Image(systemName: "mappin.and.ellipse")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30, alignment: .center)
                        Text("Direction")
                            .fontWeight(.regular)
                            .font(Font(CTFont.init(.label, size: 13)))
                            
                    }
                    Spacer()
                    VStack {
                        HStack {
                            Image(systemName: "star")
                            Text("\(4)")
                        }
                        .padding(EdgeInsets(top: 6, leading: 16, bottom: 6, trailing: 16))
                        .overlay {
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.black, lineWidth: 1)
                        }
                        Text("100+ rating")
                    }
                }
                .padding(16)
            }
        }
    }
}

struct ArtistsListView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistsListView()
    }
}


#Preview {
    ArtistsListView()
}
