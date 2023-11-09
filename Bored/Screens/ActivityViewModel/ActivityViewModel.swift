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
                //Add a small delay for improved UX
                try await Task.sleep(for: .seconds(1.5))
                activity = try await NetworkManager.shared.getActivity()
                isLoading = false
            }
            catch{
                print("Error: \(error)")
            }
        }
    }
    
    var animationSize: CGSize{
        switch activity?.type{
        case "education": return CGSize(width: 0.5, height: 0.5)
        case "recreational": return CGSize(width: 0.09, height: 0.09)
        case "social": return CGSize(width: 0.8, height: 0.8)
        case "diy": return CGSize(width: 0.4, height: 0.4)
        case "charity": return CGSize(width: 0.8, height: 0.8)
        case "cooking": return CGSize(width: 0.35, height: 0.35)
        case "relaxation": return CGSize(width: 1.1, height: 1.1)
        case "music": return CGSize(width: 1.25, height: 1.25)
        case "busywork": return CGSize(width: 0.55, height: 0.55)
        default: return CGSize(width: 0.5, height: 0.5)
        }
    }
}
