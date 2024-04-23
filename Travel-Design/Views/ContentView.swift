//
//  ContentView.swift
//  Travel-Design
//
//  Created by PC on 23/04/2024.
//

import SwiftUI

struct ContentView: View {
    @State var search = ""
    @State var selectedFilter: String?
    let filters = ["Most Viewed", "Nearby", "Latest", "New"]
    
    init(){
        selectedFilter = filters.first
    }
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 40) {
                    Spacer()
                        .frame(height: 38)
                    HStack {
                        TextField("Search places", text: $search)
                        RoundedRectangle(cornerRadius: 100)
                            .frame(width: 2, height: 32)
                            .foregroundStyle(Color._D2D2D2)
                            .padding(.trailing, 29)
                        Image(Assets.setting)
                    }
                    .padding(.horizontal, 31)
                    .padding(.vertical, 13)
                    .background{
                        RoundedRectangle(cornerRadius: 20).stroke().foregroundStyle(Color._D2D2D2)
                    }
                    .padding(.horizontal, 20)
                    
                    HStack {
                        Text("Popular places")
                            .font(.system(size: 20, weight: .semibold))
                        .foregroundStyle(Color._2F2F2F)
                        Spacer()
                        Text("View all")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundStyle(Color._888888)
                    }
                    .padding(.horizontal, 20)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 25) {
                            ForEach(filters, id: \.self) { filter in
                                Button {
                                    withAnimation(.interactiveSpring) {
                                        selectedFilter = filter
                                    }
                                } label: {
                                    Text(filter)
                                        .font(.system(size: 16, weight: .bold))
                                        .foregroundStyle(filter == selectedFilter ? .white : Color._C5C5C5)
                                        .padding(.horizontal, 21)
                                        .padding(.vertical, 18)
                                        .background(filter == selectedFilter ? Color._2F2F2F : Color._FBFBFB)
                                        .clipShape(RoundedRectangle(cornerRadius: 20))
                                }
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 22) {
                            ForEach(LocationModel.locations) { location in
                                NavigationLink(value: location) {
                                    LocationCardView(location: location)
                                }
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                    Spacer()
                        .frame(height: 10)
                }
                .padding(.bottom, 20)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        VStack(spacing: 9) {
                            Text("Hi, David 👋")
                                .font(.system(size: 30, weight: .semibold))
                                .foregroundStyle(Color._2F2F2F)
                            
                            Text("Explore the world")
                                .font(.system(size: 20, weight: .medium))
                                .foregroundStyle(Color._888888)
                        }
                    }
                    
                    ToolbarItem {
                        Image(Assets.profile)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                    }
                    
                }
                .navigationDestination(for: LocationModel.self) { location in
                    LocationDetailsView(location: location)
                        .navigationBarBackButtonHidden()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
