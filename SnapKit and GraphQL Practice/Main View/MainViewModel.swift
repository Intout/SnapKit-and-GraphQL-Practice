//
//  MainViewModel.swift
//  SnapKit and GraphQL Practice
//
//  Created by Mert Tecimen on 25.06.2022.
//

import Foundation

protocol MainViewModelDelegate: AnyObject{
    func didFetched(for data: [CharacterData])
    func didFetchedFailed(with error: Error)
}

class MainViewModel {
    private var dataModel = MainViewDataModel()
    weak var delegate: MainViewModelDelegate?
    
    func viewDidLoad(){
        fetchData()
    }
    
}

private extension MainViewModel{
    func fetchData(){
        dataModel.fetchData{ data, error in
            if let data = data {
                self.delegate?.didFetched(for: data)
            } else {
                self.delegate?.didFetchedFailed(with: error!)
            }
        }
    }
}
