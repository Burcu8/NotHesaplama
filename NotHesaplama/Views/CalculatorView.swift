//
//  CalculatorView.swift
//  NotHesaplama
//
//  Created by Burcu Kamilçelebi on 4.09.2023.
//

import SwiftUI

struct CalculatorView: View {
    
    @State var textFieldText1: String = ""
    @State var textFieldText2: String = ""
    //@State var sonuc: Float = 32
    //let selectedItem: String
    var vizeNotu: Int = 0
    var finalNotu: Int = 0
    
    var body: some View {
        VStack(spacing: 10) {
                        
            HStack{
                Text("Vize Notu:")
                TextField("Notunuzu Giriniz", text: $textFieldText1)
                //.textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .background(Color.gray.opacity(0.3)).cornerRadius(10)
                    .foregroundColor(.red)
                    .font(.headline)
            }
            HStack{
                Text("Final Notu:")
                TextField("Notunuzu Giriniz", text: $textFieldText2)
                //.textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .background(Color.gray.opacity(0.3)).cornerRadius(10)
                    .foregroundColor(.red)
                    .font(.headline)
            }
            
            Button("Hesapla") {
                //
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.accentColor).cornerRadius(10).shadow(radius: 10)
            .foregroundColor(.white)
            .font(.headline)
            
            HStack{
                Text("Sonuç: ")
               // Text($sonuc)
                    .font(.title2)
                
            }
        }.padding()
        .offset(y: -60)
    }
    
    
}


struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
