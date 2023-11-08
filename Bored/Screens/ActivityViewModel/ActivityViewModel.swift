//
//  ActivityViewModel.swift
//  Bored
//
//  Created by Nihal Ismail on 11/8/23.
//

import Foundation

@Observable class ActivityViewModel{
    var activity: Activity?
    var isLoading = false
    var activityLink: URL{
        if let activity{
            if !activity.link.isEmpty{
                return URL(string: activity.link) ?? defaultUrl
            } else{
                return URL(string: activity.activity.googleSearchUrlString) ?? defaultUrl
            }
        }
        return defaultUrl
    }
    
    let defaultUrl = URL(string: "https://www.apple.com/")!
    
    func loadActivity(){
        isLoading = true
        Task{
            do{
                activity = try await NetworkManager.shared.getActivity()
                isLoading = false
            }
            catch{
                print("Error: \(error)")
            }
        }
    }
    
    func launchLink(){
        
    }
}
