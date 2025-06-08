//
//  toWatchView.swift
//  Cinefile
//
//  Created by Joje on 06/06/25.
//

//
//  FavoritosView.swift
//  Cinefile
//
//  Created by Joje on 05/06/25.
//

import SwiftUI

struct ToWatchView: View {
    
    @Binding var dataModel: DataModel
    @Binding var selectedTab: ContentView.tabIdentifier
    @Binding var genreToSearch: String?
    
    let columns = [
        GridItem(.adaptive(minimum: 100))
    ]
    
    private var toWatchMovieIndices: [Int] {
        dataModel.filmLists.indices.filter { dataModel.filmLists[$0].isOnWatchlist }
    }
    
    var body: some View {
        
        NavigationStack{

            ZStack{
                LinearGradient(gradient: Gradient(colors: [.fundoEscuro, .fundoClaro]), startPoint: .top, endPoint: .bottom)
                ScrollView {
                    
                    VStack {
                        Spacer()
                            .frame(height: 80)
                        
                        Text("Watchlist")
                            .font(.title)
                            .foregroundStyle(.white)
                        
                        LazyVGrid(columns: columns, spacing: 30) {
                            if dataModel.filmLists.isEmpty {
                                Text("Nenhum filme adicionado a sua lista.")
                                    .font(.caption)
                            }
                            else {
                                ForEach(toWatchMovieIndices, id: \.self) { index in
                                    NavigationLink {
                                        MovieDetailView(movie: $dataModel.filmLists[index], selectedTab: $selectedTab, genreToSearch: $genreToSearch)
                                    } label: {
                                        CardMovieView(movie: dataModel.filmLists[index])
                                    }
                                }
                            }
                        }
                        .padding(10)
                        
                        Spacer()
                            .frame(height: 90)
                    }
                    
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
        }
    }
    
    
}

