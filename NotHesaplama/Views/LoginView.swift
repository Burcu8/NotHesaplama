//
//  LoginView.swift
//  NotHesaplama
//
//  Created by Burcu Kamilçelebi on 4.09.2023.
//

import SwiftUI

struct LoginView: View {
    
    @Environment(\.presentationMode) var presentetionMode
    @State var textFieldText: String = ""
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    @State var goClassView: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack{
                TextField("Adınızı Giriniz", text: $textFieldText)
                //.textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .background(Color.gray.opacity(0.3)).cornerRadius(10)
                    .foregroundColor(.red)
                    .font(.headline)
                
                Button(action: saveButtonPressed, label: {
                    Text("Başla".uppercased())
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.accentColor).cornerRadius(10).shadow(radius: 10)
                    .foregroundColor(.white)
                    .font(.headline)
                    .fullScreenCover(isPresented: $goClassView) {
                        ClassesView()
                    }
                })
                Spacer()
            }
            .padding(20)
            .navigationTitle("Hoşgeldin")
            .alert(isPresented: $showAlert, content: getAlert)
        }
    }
    
    func saveButtonPressed() {
        if textIsAppropriate() == true {
            presentetionMode.wrappedValue.dismiss()
            goClassView = true
        }
            
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 2 {
            alertTitle = " Your name must be at least 3 characters long!"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
