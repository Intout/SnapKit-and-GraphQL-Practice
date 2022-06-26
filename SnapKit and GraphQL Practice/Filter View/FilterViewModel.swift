//
//  FilterViewModel.swift
//  SnapKit and GraphQL Practice
//
//  Created by Mert Tecimen on 26.06.2022.
//

import Foundation

protocol FilterViewModelDelegate: AnyObject{
    func didDataFetched(for tag: FilterTags?)
}

class FilterViewModel{
    
    private var dataModel = FilterViewDataModel()
    weak var delegate: FilterViewModelDelegate?
   
    func viewDidLoad(){
        delegate?.didDataFetched(for: dataModel.fetchSelectedTag())
    }
    
    
    
    
}


extension FilterViewModel{
    func setSelectedTag(as tag: FilterTags?){
        dataModel.setSelectedTag(as: tag)
    }
}
