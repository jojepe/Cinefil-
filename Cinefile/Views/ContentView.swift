//
//  ContentView.swift
//  Cinefile
//
//  Created by Joje on 29/05/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var dataModel: DataModel = .init()
    @State var selectedTab: tabIdentifier = .catalogo
    @State var genreToSearch: String? = nil
    
    enum tabIdentifier: Hashable {
        case catalogo, pesquisa, perfil
    }
    
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
        UITabBar.appearance().standardAppearance = appearance
        
        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }
    
    
    
    var body: some View {
        TabView(selection: $selectedTab) {
            
            CatalogView(dataModel: $dataModel, selectedTab: $selectedTab, genreToSearch: $genreToSearch)
                .tabItem {
                    Label("Players", systemImage: "film.stack")
                }
                .tag(tabIdentifier.catalogo) // Tag aplicada à CatalogView
            
            
            PesquisaView(dataModel: $dataModel, initialSearchText: genreToSearch, onSearchHandled: {
                genreToSearch = nil 
            })
            .tabItem {
                Label("Pesquisa", systemImage: "magnifyingglass")
            }
            .tag(tabIdentifier.pesquisa) // Tag aplicada à PesquisaView
            
            // Aba "Perfil"
            ProfileView(dataModel: $dataModel, selectedTab: $selectedTab, genreToSearch: $genreToSearch)
                .tabItem {
                    Label("Perfil", systemImage: "person.circle")
                }
                .tag(tabIdentifier.perfil)
        }
        .tint(.menta)
        .navigationBarBackButtonHidden(true)
        .onChange(of: genreToSearch) { oldValue, newValue in
            // Se um gênero for definido para pesquisa, mude para a aba de pesquisa
            if newValue != nil {
                selectedTab = .pesquisa
            }
        }
    }
}

#Preview {
    ContentView()
}
