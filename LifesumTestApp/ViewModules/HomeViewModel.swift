//
//  HomeViewModel.swift
//  LifesumTestApp
//
//  Created by Guglielmo Chimera on 21/06/22.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var results = HomeModel()
    @Published var alert = false
    @Published var foodId = 0
    
    func performSearch() -> HomeModel {
        
        // set random id
        self.foodId = Int.random(in: 1...99)
        
        print(foodId)
        
        // Make Api call
        GenericRequestAPI.shared.dataRequest(with: "\(RequestUrl.baseURL)\(RequestUrl.path)\(foodId)", objectType: HomeModel.self)
        { result in
            switch result {
            case .success(let object):
                print(object)
                DispatchQueue.main.async { [weak self] in
                    self?.results = object
                    self?.alert = false
                }
            case .failure(let error):
                print(error)
                self.alert = true
                // reset results
                self.results = HomeModel()
            }
        }
        
        return HomeModel()
        
    }
    
}
