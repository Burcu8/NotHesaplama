//
//  NoItemView.swift
//  NotHesaplama
//
//  Created by Burcu Kamilçelebi on 6.09.2023.
//

import SwiftUI

struct NoItemView: View {
    @State var animate: Bool = false
    let secondaryAccentColor = Color("SecondaryAccentColor")
    @State private var showsheet: Bool = false
    
    var body: some View {
        ScrollView{
            VStack(spacing: 10) {
                Text("Herhangi bir ders yok")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Hadi ders ekleyelim☺️")
                    .padding(.bottom, 20)
                Button("Ders Ekle 🥳") {
                    showsheet.toggle()
                    }
                .foregroundColor(.white)
                .font(.headline)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(animate ? secondaryAccentColor : Color.accentColor)
                .background(Color.accentColor)
                .cornerRadius(10)
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(
                    color: animate ? secondaryAccentColor.opacity(0.7) :
                        Color.accentColor.opacity(0.7),
                    radius: animate ? 30 : 10,
                    x: 0,
                    y: animate ? 50 : 30 )
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
                .sheet(isPresented: $showsheet) {
                    AddClassView()
                }.presentationDetents([.fraction(0.2), .medium])
                
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
    }

    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

struct NoItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            NoItemView()
                .navigationTitle(("Dersler"))
        }
    }
}
