//
//  ArtistsListView.swift
//  KeiLU
//
//  Created by zhanybek salgarin on 2/1/24.
//

import SwiftUI

struct ArtistModel: Hashable {
    let logo: String
    let name: String
    let minimumPrice: Int
    let averageDuration: Int
    let sesrvices: [String]
}

struct ArtistsListView: View {
    
    @State var artists: [ArtistModel] = [
        ArtistModel(logo: "nailArtist2",
                    name: "LucysSpot",
                    minimumPrice: 45, 
                    averageDuration: 40,
                    sesrvices: ["Face" , "Nails", "Massage"]),
        ArtistModel(logo: "nailArtist3",
                    name: "LucysSpot",
                    minimumPrice: 45,
                    averageDuration: 40,
                    sesrvices: ["Face" , "Nails", "Massage"]),
        ArtistModel(logo: "nailArtist4",
                    name: "LucysSpot",
                    minimumPrice: 45,
                    averageDuration: 40,
                    sesrvices: ["Face" , "Nails", "Massage"]),
        ArtistModel(logo: "nailArtist5",
                    name: "LucysSpot",
                    minimumPrice: 45,
                    averageDuration: 40,
                    sesrvices: ["Face" , "Nails", "Massage"])
    ]
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ZStack(alignment: .bottomLeading) {
                    Image("nailArtist")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: geometry.size.width)
                        .ignoresSafeArea()

                    VStack(alignment: .leading, spacing: 3) {
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
                    .padding(EdgeInsets(top: 8, leading: 24, bottom: 8, trailing: 24))
                    .background(Color.black.opacity(0.6))
                    .clipShape(RoundedRectangle(cornerRadius: 16))
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
                            .font(.system(size: 13, weight: .regular))
                            
                    }
                    Spacer()
                    VStack {
                        HStack {
                            Image(systemName: "star")
                                .foregroundStyle(Color.blue)
                            Text("\(4)")
                                .foregroundStyle(Color.blue)
                        }
                        .padding(EdgeInsets(top: 6, leading: 10, bottom: 6, trailing: 10))
                        .overlay {
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.blue, lineWidth: 1)
                        }
                        Text("100+ rating")
                            .font(.system(size: 13, weight: .regular))
                            .foregroundStyle(Color.blue)
                    }
                }
                .padding(20)
                List {
                    ForEach(artists, id: \.self) { artist in
                        HStack {
                            Image(artist.logo)
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: 100, maxHeight: 100)
                                .clipShape(RoundedRectangle(cornerRadius: 14))
                            VStack(alignment: .leading) {
                                Text(artist.name)
                                    .font(.title3)
                                    .bold()
                                Text("$\(artist.minimumPrice)")
                                    .foregroundStyle(.gray)
                                Spacer()
                                Text("\(artist.averageDuration) Mins")
                                    .foregroundStyle(.gray)
                                    .font(.system(size: 13))
                            }
                            .padding(EdgeInsets(top: 10, leading: 2, bottom: 10, trailing: 2))
                        }
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)) // Remove list row insets
//                        .padding()
                        .frame(height: 100)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
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
