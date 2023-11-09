//
//  ActivityViewModel.swift
//  Bored
//
//  Created by Nihal Ismail on 11/8/23.
//

import SwiftUI

@Observable class ActivityViewModel{
    var activity: Activity?
    var isLoading = false
    var isError = false
    
    let defaultUrl = URL(string: "https://www.apple.com/")!
    
    func loadActivity(){
        isLoading = true
        Task{
            do{
                //Add a small delay for improved UX
                try await Task.sleep(for: .seconds(1.5))
                activity = try await NetworkManager.shared.getActivity()
                isError = false
            }
            catch{
                isError = true
            }
            
            isLoading = false
        }
    }
    
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
    
    var animationSize: CGSize{
        switch activity?.type{
        case "education": return CGSize(width: 0.5, height: 0.5)
        case "recreational": return CGSize(width: 0.4, height: 0.4)
        case "social": return CGSize(width: 0.8, height: 0.8)
        case "diy": return CGSize(width: 0.4, height: 0.4)
        case "charity": return CGSize(width: 0.8, height: 0.8)
        case "cooking": return CGSize(width: 0.35, height: 0.35)
        case "relaxation": return CGSize(width: 1, height: 1)
        case "music": return CGSize(width: 1.1, height: 1.1)
        case "busywork": return CGSize(width: 0.55, height: 0.55)
        default: return CGSize(width: 0.5, height: 0.5)
        }
    }
    
    var activityThemeColor: Color{
        switch activity?.type{
        case "education": return Color(.colorEducationRelaxation)
        case "recreational": return Color(.colorRecreational)
        case "social": return Color(.colorSocial)
        case "diy": return Color(.colorDIY)
        case "charity": return Color(.colorCharity)
        case "cooking": return Color(.colorCookingMusic)
        case "relaxation": return Color(.colorEducationRelaxation)
        case "music": return Color(.colorCookingMusic)
        case "busywork": return Color(.colorBusyWork)
        default: return Color(.colorEducationRelaxation)
        }
    }
}
