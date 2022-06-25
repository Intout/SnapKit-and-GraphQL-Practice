//
//  MainViewDataModel.swift
//  SnapKit and GraphQL Practice
//
//  Created by Mert Tecimen on 25.06.2022.
//

import Foundation

class MainViewDataModel{
    
    private let url = URL(string: "https://rickandmortyapi.com/graphql")
    
    func fetchData(complationHandler: @escaping ([CharacterData]?, Error?) -> ()){
        guard let url = url else {
            return
        }
        
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
