//
//  MainViewDataModel.swift
//  SnapKit and GraphQL Practice
//
//  Created by Mert Tecimen on 25.06.2022.
//

import Foundation

class MainViewDataModel{
    
    
    
    /// Fetch data using ApolloQuery Helper and returns a complationHandler
    /// - Parameter complationHandler: Fetched charater data and error for request.
    func fetchData(complationHandler: @escaping ([CharacterData]?, Error?) -> ()){
        
        ApolloQueryHelper.shared.apollo.fetch(query: CharactersQuery()){ result in
            switch result{
            case .success(let queryResult):
                
                if let results = queryResult.data?.characters?.results{
                    let charactersData: [CharacterData] = results.map { (data) -> CharacterData in
                        return CharacterData(id: data?.id, image: data?.image, name: data?.name, location: data?.location?.name)
                   }
                    print(charactersData)
                    complationHandler(charactersData, nil)
                    return
                }
                
            case .failure(let error):
                print(error)
                complationHandler(nil, error)
                return
            }
        }
    }
    
}
