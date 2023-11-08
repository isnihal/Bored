//
//  Activity.swift
//  Bored
//
//  Created by Nihal Ismail on 11/8/23.
//

import Foundation

struct Activity: Codable{
    let key: String
    let activity: String
    let type: String
    let link: String
    let participants: Int
    let price: Float
    let accessibility: Float
}
