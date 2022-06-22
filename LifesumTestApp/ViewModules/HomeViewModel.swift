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
    
    func performRequest() {
        
        guard let gUrl = URL(
            string: "https://api.lifesum.com/v2/foodipedia/codetest?foodid=\(Int.random(in: 1...99))"
        ) else { return }
        
        
        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: gUrl)
                let response = try JSONDecoder()
                    .decode(HomeModel.self, from: data)
                DispatchQueue.main.async { [weak self] in
                    self?.results = response
                    self?.alert = false
                }
            } catch {
                print("*** ERROR ***")
                DispatchQueue.main.async { [weak self] in
                    self?.alert = true
                }
            }
        }
    }
}
