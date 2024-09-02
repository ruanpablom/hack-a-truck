//
//  ContentView.swift
//  Estacionamento
//
//  Created by Ruan Medeiros on 11/04/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var estacionamentoViewModel = EstacionamentoViewModel()
    @State var nome = "Hadouken"
    
    
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
            VStack {
                Text(estacionamentoViewModel.estacionamentos.first?.carros![0].modelo! ?? "Default")
                    .foregroundStyle(.blue)
//                TextField("Nome", text: $nome)
//                    .padding()
//                    .background(Color.white)
//                    .cornerRadius(10)
                Button("Enviar"){
                    estacionamentoViewModel.estacionamentos[0].nomeEstacionamento = nome
                    estacionamentoViewModel.put(body: estacionamentoViewModel.estacionamentos[0])
                    print(estacionamentoViewModel.estacionamentos)
                }.padding()
                .background(Color.blue)
                .cornerRadius(10)
                .accentColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                
                
                
            }

        }.onAppear(){
            estacionamentoViewModel.fetch()
        }
    }
}

#Preview {
    ContentView()
}
