//
//  NetworkManager.swift
//  Bored
//
//  Created by Nihal Ismail on 11/8/23.
//

import Foundation

final class NetworkManager{
    
    static let shared = NetworkManager()
    
    private init(){
        
    }
    
    private let baseUrl = "http://www.boredapi.com/api/"
    
    func getActivity() async throws -> Activity{
        let activityUrl = baseUrl + "activity/"
        
        guard let url = URL(string: activityUrl) else{
            throw ActivityError.invalidUrl
        }
        
        let (data,response) = try await URLSession.shared.data(from: url)
        
        if let response = response as? HTTPURLResponse{
            if response.statusCode != 200{
                throw ActivityError.serverError(statusCode: response.statusCode)
            }
            
            do{
                return try JSONDecoder().decode(Activity.self, from: data)
            }
            catch{
                throw ActivityError.invalidData
            }
        } else{
            throw ActivityError.invalidResponse
        }
    }
}
