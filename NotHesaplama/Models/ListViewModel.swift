//
//  ListViewModel.swift
//  NotHesaplama
//
//  Created by Burcu Kamilçelebi on 6.09.2023.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = [] {
        //every funcs that include items calls saveItem()
        didSet {
            saveItem()
        }
    }
    let itemKey: String = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems() {

        guard
            let data = UserDefaults.standard.data(forKey: itemKey),
            let savedItem = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        self.items = savedItem
    }

    
    //delete item func
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    //move item func
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    //add item func
    func addItem(title: String) {
        let newItem = ItemModel(title: title)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: {$0.id == item.id}) {
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItem() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemKey)
        }
    }
}
