//
//  LocationCardView.swift
//  Travel-Design
//
//  Created by PC on 23/04/2024.
//

import SwiftUI

struct LocationCardView: View {
    let location: LocationModel
    var body: some View {
        Image(location.image)
            .resizable()
            .frame(width: 270, height: 405)
            .scaledToFill()
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .overlay {
                VStack {
                    HStack {
                        Spacer()
                        RoundedRectangle(cornerRadius: 44)
                            .frame(width: 44, height: 44)
                            .foregroundStyle(Color._1D1D1D.opacity(0.4))
                            .overlay{
                                Image(Assets.heart)
                        }
                    }
                    
                    
                        
                    Spacer()
                    VStack(alignment:.leading, spacing: 13) {
                        Text(location.name)
                            .font(.system(size: 14, weight: .bold))
                            .foregroundStyle(.white)
                        HStack(spacing: 12) {
                            Image(Assets.marker)
                            Text(location.address)
                                .font(.system(size: 14))
                                .foregroundStyle(Color._CAC8C8)
                            Spacer()
                            HStack(spacing: 6) {
                                Image(Assets.star)
                                Text(location.rating)
                                    .font(.system(size: 14))
                                    .foregroundStyle(Color._CAC8C8)
                            }
                            
                        }
                    }
                    .padding(.horizontal, 14)
                    .padding(.vertical, 11)
                    .background(Color._1D1D1D.opacity(0.4))
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .shadow(color: .white.opacity(0.1), radius: 9, y: 5)
                }
                .padding(EdgeInsets.init(top: 10, leading: 25, bottom: 25, trailing: 25))
            }
            .shadow(color: .black.opacity(0.4), radius: 6, y: 4)
    }
}

#Preview {
    LocationCardView(location: LocationModel.locations.first!)
}
