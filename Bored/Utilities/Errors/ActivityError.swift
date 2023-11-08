//
//  ActivityError.swift
//  Bored
//
//  Created by Nihal Ismail on 11/8/23.
//

import Foundation

enum ActivityError: Error{
    case invalidUrl
    case invalidResponse
    case serverError(statusCode: Int)
    case invalidData
}
