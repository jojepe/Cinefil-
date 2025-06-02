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
                let appearance = UITabBarAppearance()
                appearance.configureWithTransparentBackground()
    //ULTRA THIN KKKKK

                appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
                UITabBar.appearance().standardAppearance = appearance
                
                if #available(iOS 15.0, *) {
                    UITabBar.appearance().scrollEdgeAppearance = appearance
                }
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
