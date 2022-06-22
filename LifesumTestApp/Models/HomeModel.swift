//
//  ReturnModel.swift
//  LifesumTestApp
//
//  Created by Guglielmo Chimera on 21/06/22.

import Foundation

// MARK: - HomeModel
class HomeModel: Codable {
    var meta: Meta?
    var response: Response?

    enum CodingKeys: String, CodingKey {
        case meta
        case response
    }
}

// MARK: - Meta
class Meta: Codable {
    let code: Int?

    enum CodingKeys: String, CodingKey {
        case code
    }

    init(code: Int?) {
        self.code = code
    }
}


// MARK: - Response
class Response: Codable {
    let title: String?
    let calories: Int?
    let carbs: Double?
    let protein: Double?
    let fat: Double?
    let saturatedfat: Double?
    let unsaturatedfat: Double?
    let fiber: Double?
    let cholesterol: Double?
    let sugar: Double?
    let sodium: Double?
    let potassium: Double?
    let gramsperserving: Double?
    let pcstext: String?

    enum CodingKeys: String, CodingKey {
        case title
        case calories
        case carbs
        case protein
        case fat
        case saturatedfat
        case unsaturatedfat
        case fiber
        case cholesterol
        case sugar
        case sodium
        case potassium
        case gramsperserving
        case pcstext
    }

    init(title: String?, calories: Int?, carbs: Double?, protein: Double?, fat: Double?, saturatedfat: Double?, unsaturatedfat: Double?, fiber: Double?, cholesterol: Double?, sugar: Double?, sodium: Double?, potassium: Double?, gramsperserving: Double?, pcstext: String?) {
        self.title = title
        self.calories = calories
        self.carbs = carbs
        self.protein = protein
        self.fat = fat
        self.saturatedfat = saturatedfat
        self.unsaturatedfat = unsaturatedfat
        self.fiber = fiber
        self.cholesterol = cholesterol
        self.sugar = sugar
        self.sodium = sodium
        self.potassium = potassium
        self.gramsperserving = gramsperserving
        self.pcstext = pcstext
    }
}
