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
    @Published var alertText: String?
    @Published var foodId = 0
    
    func performRequest() -> HomeModel {
        
        // Set random id
        self.foodId = Int.random(in: 1...99)
        
        print(foodId)
        
        // Make Api call
        GenericRequestAPI.shared.dataRequest(with: "\(RequestUrl.baseURL)\(RequestUrl.path)\(foodId)", objectType: HomeModel.self)
        { result in
            switch result {
            case .success(let object):
                print(object.meta!)
                switch object.meta?.code {
                case 200:
                    print("Success")
                    DispatchQueue.main.async { [weak self] in
                        self?.results = object
                        self?.alert = false
                    }
                default:
                    DispatchQueue.main.async { [weak self] in
                        self?.alert = true
                        self?.alertText = "Bad request"
                        // reset results
                        self?.results = HomeModel()
                    }
                }
                
                
            case .failure(let error):
                print(error)
                DispatchQueue.main.async { [weak self] in
                    self?.alert = true
                    self?.alertText = "Bad connection"
                    // reset results
                    self?.results = HomeModel()
                }
            }
        }
        
        return HomeModel()
        
    }
    
}
