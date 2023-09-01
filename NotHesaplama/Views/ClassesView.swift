//
//  ClassesView.swift
//  NotHesaplama
//
//  Created by Burcu Kamilçelebi on 4.09.2023.
//

import SwiftUI

struct ClassesView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
            ZStack {
                if listViewModel.items.isEmpty {
                    NoItemView()
                        .transition(AnyTransition.opacity.animation(.easeIn))
                } else {
                    List {
                        ForEach(listViewModel.items) { item in
                            ListRowView(item: item)
                                .onTapGesture {
                                    withAnimation(.linear) {
                                        listViewModel.updateItem(item: item)
                                    }
                                }
                        }
                        //delete item
                        .onDelete(perform: listViewModel.deleteItem)
                        //move item
                        .onMove(perform: listViewModel.moveItem)
                    }
                    .navigationBarItems(
                       // leading: EditButton(),
                        trailing:
                            NavigationLink("Add", destination: AddClassView())
                    )
                  
                }
            }
            .navigationTitle("Ders Seçimi:")
           
        
    
    }
}

struct ClassesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ClassesView()
        }
        .environmentObject(ListViewModel())
        
    }
}
