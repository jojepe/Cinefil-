//
//  ContentView.swift
//  Cinefile
//
//  Created by Joje on 29/05/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var dataModel: DataModel = .init()
    
    init() {
        UITabBar.appearance().backgroundColor = .white
        }
    
    var body: some View {
                
        TabView {
            
            Tab("Players", systemImage: "film.stack"){
                CatalogView(dataModel: $dataModel)
            }
            
            Tab("Pesquisa", systemImage: "magnifyingglass") {
                PesquisaView(dataModel: $dataModel)
            }
            
            Tab("Perfil", systemImage: "person.circle") {
                ProfileView(dataModel: $dataModel)
            }
        }
        .tint(.menta)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ContentView()
}
