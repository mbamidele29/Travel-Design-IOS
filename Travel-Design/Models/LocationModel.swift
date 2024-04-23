//
//  LocationModel.swift
//  Travel-Design
//
//  Created by PC on 23/04/2024.
//

import Foundation

struct LocationModel: Identifiable, Hashable {
    var id = UUID()
    let name: String
    let address: String
    let price: Double
    let rating: String
    let image: String
}


extension LocationModel {
    static let locations: [LocationModel] = [
        LocationModel(name: "Mount Fuji", address: "Tokyo, Japan", price: 300, rating: "4.8", image: Assets.fuji),
        LocationModel(name: "Andes Mountain", address: "South, America", price: 230, rating: "4.8", image: Assets.andes),
        LocationModel(name: "Mount Fuji", address: "Tokyo, Japan", price: 300, rating: "4.8", image: Assets.fuji),
        LocationModel(name: "Andes Mountain", address: "South, America", price: 230, rating: "4.8", image: Assets.andes),
        LocationModel(name: "Mount Fuji", address: "Tokyo, Japan", price: 300, rating: "4.8", image: Assets.fuji),
        LocationModel(name: "Andes Mountain", address: "South, America", price: 230, rating: "4.8", image: Assets.andes),
    ];
}
