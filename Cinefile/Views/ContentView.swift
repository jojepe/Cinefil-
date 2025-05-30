//
//  ContentView.swift
//  Cinefile
//
//  Created by Joje on 29/05/25.
//

import SwiftUI

struct ContentView: View {
    init() {
        UITabBar.appearance().backgroundColor = .white
        }
    var body: some View {
                
        TabView {
            
            Tab("Players", systemImage: "film.stack"){
                CatalogView()
            }
            
            Tab("Contatos", systemImage: "magnifyingglass") {
                CardMovieView(movie: Movie(poster: "land", title: "La La Land", year: "2017", synopsis: "O pianista Sebastian conhece a atriz Mia, e os dois se apaixonam perdidamente. Em busca de oportunidades para suas carreiras na competitiva Los Angeles, os jovens tentam fazer o relacionamento amoroso dar certo, enquanto perseguem fama e sucesso.", director: "Damien Chazelle", writers: "Damien Chazelle", isFavorite: false, isWatched: false, rating: 0))
            }
            
            Tab("Perfil", systemImage: "person.circle") {
                ProfileView()
            }
        }
        .tint(.menta)
    }
}

#Preview {
    ContentView()
}
