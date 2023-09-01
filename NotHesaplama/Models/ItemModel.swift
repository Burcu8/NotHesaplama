//
//  ItemModel.swift
//  NotHesaplama
//
//  Created by Burcu Kamilçelebi on 6.09.2023.
//

import Foundation

//Immutable Struct
class ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    
    init(id: String = UUID().uuidString, title: String) {
        self.id = id
        self.title = title
    }
    
    func updateCompletion() ->ItemModel {
        return ItemModel(id: id, title: title)
    }
    
}
