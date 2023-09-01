//
//  LoginView.swift
//  NotHesaplama
//
//  Created by Burcu Kamilçelebi on 4.09.2023.
//

import SwiftUI

struct LoginView: View {
    
    @State var textFieldText: String = ""
    
    var body: some View {
        NavigationStack {
            VStack{
                TextField("Adınızı Giriniz", text: $textFieldText)
                    //.textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .background(Color.gray.opacity(0.3)).cornerRadius(10)
                    .foregroundColor(.red)
                    .font(.headline)
                
                NavigationLink(destination: ClassesView(), label: {
                    Text("Başla".uppercased())
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor).cornerRadius(10).shadow(radius: 10)
                        .foregroundColor(.white)
                        .font(.headline)
                })
                Spacer()
            }
            .padding(20)
            .navigationTitle("Hoşgeldin")
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
