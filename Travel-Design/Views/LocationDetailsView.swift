//
//  LocationDetailsView.swift
//  Travel-Design
//
//  Created by PC on 23/04/2024.
//

import SwiftUI

struct LocationDetailsView: View {
    let location: LocationModel
    
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                VStack(alignment: .leading, spacing: 40) {
                    Image(location.image)
                        .resizable()
                        .frame(width: 374, height: 460)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .overlay {
                            VStack {
                                HStack {
                                    Button{
                                        mode.wrappedValue.dismiss()
                                    } label: {
                                        RoundedRectangle(cornerRadius: 44)
                                            .frame(width: 44, height: 44)
                                            .foregroundStyle(Color._1D1D1D.opacity(0.4))
                                            .overlay{
                                                Image(Assets.arrowLeft)
                                        }
                                    }
                                    Spacer()
                                    RoundedRectangle(cornerRadius: 44)
                                        .frame(width: 44, height: 44)
                                        .foregroundStyle(Color._1D1D1D.opacity(0.4))
                                        .overlay{
                                            Image(Assets.archive)
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
                            }
                            .padding(.init(top: 18, leading: 22, bottom: 29, trailing: 22))
                        }
                        .shadow(color: .black.opacity(0.4), radius: 6, y: 4)
                    
                    HStack(spacing: 22) {
                        Text("Overview")
                            .font(.system(size: 22, weight: .semibold))
                        .foregroundStyle(Color._1B1B1B)
                        Text("Details")
                            .font(.system(size: 16))
                            .foregroundStyle(Color._1B1B1B.opacity(0.62))
                            .offset(y: 5)
                    }
                    
                    HStack {
                        TemperatureView(image: Assets.clock, value: "8 hours")
                        Spacer()
                        TemperatureView(image: Assets.cloud, value: "16 C")
                        Spacer()
                        TemperatureView(image: Assets.starFilled, value: location.rating)
                    }
                    
                    Text("This vast mountain range is renowned for its remarkable diversity in terms of topography and climate. It features towering peaks, active volcanoes, deep canyons, expansive plateaus, and lush valleys. The Andes are also home to ")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundStyle(Color._A5A5A5)
                    
                }
            }
            .padding(28)
            Button{
                
            } label: {
                HStack(spacing: 20) {
                    Text("Book Now")
                        .font(.system(size: 20, weight: .medium))
                        .foregroundStyle(.white)
                    
                    Image(Assets.send)
                }
                .frame(width: 373, height: 66)
                .background(Color._1B1B1B)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            }
        }
        .padding(.bottom, 30)
        .ignoresSafeArea()
    }
    
    
    @ViewBuilder private func TemperatureView(image: String, value: String) -> some View {
        HStack(spacing: 6) {
            RoundedRectangle(cornerRadius: 6)
                .frame(width: 34, height: 34)
                .foregroundStyle(Color._EDEDED)
                .overlay {
                    Image(image)
                }
            
            Text(value)
                .font(.system(size: 18, weight: .bold))
                .foregroundStyle(Color._7E7E7E)
        }
    }
}

#Preview {
    LocationDetailsView(location: LocationModel.locations.first!)
}
