//
//  AddClassView.swift
//  NotHesaplama
//
//  Created by Burcu Kamilçelebi on 6.09.2023.
//

import SwiftUI

struct AddClassView: View {
    
    @Environment(\.presentationMode) var presentetionMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    @State var someColor = #colorLiteral(red: 0.842903614, green: 0.842903614, blue: 0.8429035544, alpha: 1)   //#colorLiteral()
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack{
                TextField("Type here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                
                Button(action: saveButtonPressed, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }
            .padding(14)
        }
        .navigationTitle("Add a Class 🖊️")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonPressed() {
        if textIsAppropriate() == true {
            listViewModel.addItem(title: textFieldText)
            presentetionMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your new class must be at least 3 characters long!"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }

}


struct AddClassView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            AddClassView()
        }
        .environmentObject(ListViewModel())
    }
}
