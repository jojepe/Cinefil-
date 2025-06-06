//
//  FavoritosView.swift
//  Cinefile
//
//  Created by Joje on 05/06/25.
//

import SwiftUI

struct AssistidosView: View {
    
    @Binding var dataModel: DataModel
    @Binding var selectedTab: ContentView.tabIdentifier
    @Binding var genreToSearch: String?
    
    let columns = [
        GridItem(.adaptive(minimum: 100))
    ]
    
    private var watchedMovieIndices: [Int] {
        dataModel.filmLists.indices.filter { dataModel.filmLists[$0].isWatched }
    }
    
    var body: some View {
        
        NavigationStack{

            ZStack{
                LinearGradient(gradient: Gradient(colors: [.fundoEscuro, .fundoClaro]), startPoint: .top, endPoint: .bottom)
                ScrollView {
                    
                    VStack {
                        Spacer()
                            .frame(height: 80)
                        
                        Text("Assistidos")
                            .font(.title)
                            .foregroundStyle(.white)
                        
                        LazyVGrid(columns: columns, spacing: 30) {
                            if dataModel.filmLists.isEmpty {
                                Text("Nenhum filme adicionado aos assistidos.")
                                    .font(.caption)
                            }
                            else {
                                ForEach(watchedMovieIndices, id: \.self) { index in
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

