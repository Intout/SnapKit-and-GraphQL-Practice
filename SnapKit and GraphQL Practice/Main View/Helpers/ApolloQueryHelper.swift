//
//  ApolloQueryHelper.swift
//  SnapKit and GraphQL Practice
//
//  Created by Mert Tecimen on 25.06.2022.
//

import Foundation
import Apollo

class ApolloQueryHelper{
    static var shared = ApolloQueryHelper()
    var apollo: ApolloClient = ApolloClient(url: URL(string: "https://rickandmortyapi.com/graphql")!)
    
}
