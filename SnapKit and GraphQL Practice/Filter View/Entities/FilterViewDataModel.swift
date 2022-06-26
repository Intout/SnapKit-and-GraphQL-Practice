//
//  FilterViewDataModel.swift
//  SnapKit and GraphQL Practice
//
//  Created by Mert Tecimen on 26.06.2022.
//

import Foundation


class FilterViewDataModel{
    private var selectedTag: FilterTags?
}

extension FilterViewDataModel{
    func setSelectedTag(as tag: FilterTags){
        self.selectedTag = tag
    }
    
    func fetchSelectedTag() -> FilterTags?{
        return selectedTag
    }
}


