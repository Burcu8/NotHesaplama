//
//  NotHesaplamaApp.swift
//  NotHesaplama
//
//  Created by Burcu Kamilçelebi on 1.09.2023.
//

import SwiftUI

@main
struct NotHesaplamaApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup{
            NavigationView{
                LoginView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
       
    }
}
