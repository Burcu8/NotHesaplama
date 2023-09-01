//
//  ListRowView.swift
//  NotHesaplama
//
//  Created by Burcu Kamilçelebi on 6.09.2023.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        NavigationLink(item.title) {
            CalculatorView()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}


struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = ItemModel(title: "Matematik")
    
    static var previews: some View {
        NavigationStack{
            ListRowView(item: item1)
        }
        
    }
}

