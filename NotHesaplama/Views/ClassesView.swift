//
//  ClassesView.swift
//  NotHesaplama
//
//  Created by Burcu Kamilçelebi on 4.09.2023.
//

import SwiftUI

struct ClassesView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    @State var showSheet: Bool = false
    var body: some View {
            ZStack {
                VStack{
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
                        
                        
                    }
                    
                    Button("Ders Ekle"){
                        showSheet.toggle()
                    }
                    .padding()
                    .frame(maxWidth: 350)
                    .background(Color.accentColor).cornerRadius(10).shadow(radius: 10)
                    .foregroundColor(.white)
                    .font(.headline)
                    .sheet(isPresented: $showSheet) {
                        AddClassView()
                    }.presentationDetents([.fraction(0.2), .medium])
                    
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
