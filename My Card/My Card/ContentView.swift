//
//  ContentView.swift
//  My Card
//
//  Created by Cristian Vangheli on 27/1/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color(red: 0.82, green: 0.80, blue: 0.75).ignoresSafeArea()
            VStack{
                Image("Cristian")
                    .resizable().scaledToFit()
                    .clipShape(Circle())
                    .background(Circle().foregroundColor(.white))
                    .overlay(Circle().stroke(Color.white, lineWidth: 3))
                    .frame(width: 200, height: 200)
                    .shadow(radius: 16)
                    .offset(x:0, y: -80)
                    .padding(.bottom, -100)
                
                Text("Cristian Vangheli")
                    .font(.title)
                Text("iOS Developer")
                Divider()
                Card(image: "phone.fill", message: "+34676207238")
                Card(image: "envelope.fill", message: "vangheli.cristian22@gmail.com")
                             }.foregroundColor(.white)
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}

struct Card: View {
    let image: String
    let message: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25).padding(.horizontal).frame(height: 50)
            .overlay(HStack {Image(systemName: image)
                Text (message)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.black)
            }.foregroundColor(Color(red: 0.82, green: 0.80, blue: 0.75)))
    }
}
