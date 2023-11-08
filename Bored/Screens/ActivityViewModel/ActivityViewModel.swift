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
}
