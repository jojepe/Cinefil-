//
//  CatalogView.swift
//  Cinefile
//
//  Created by Yasmin Salamon on 29/05/25.
//

import Foundation
import SwiftUI

struct CatalogView: View {
    
    @Binding var dataModel: DataModel
    @Binding var selectedTab: ContentView.tabIdentifier
    @Binding var genreToSearch: String?
    
    let columns = [
        GridItem(.adaptive(minimum: 100))
    ]
    
    private var favoriteMovieIndices: [Int] {
        dataModel.filmLists.indices.filter { dataModel.filmLists[$0].isFavorite }
    }

    // Propriedade computada para obter os índices dos filmes marcados como assistidos
    private var watchedMovieIndices: [Int] {
        dataModel.filmLists.indices.filter { dataModel.filmLists[$0].isWatched }
    }
    
    var body: some View {
        NavigationStack{

            ZStack{
                LinearGradient(gradient: Gradient(colors: [.fundoEscuro, .fundoClaro]), startPoint: .top, endPoint: .bottom)
                ScrollView {
                    
                    VStack (spacing: 16){
                        Spacer()
                            .frame(height: 80)
                        
                        Image("logo")
                            .resizable()
                            .frame(width:74, height:55)
                            .scaledToFit()
                        
                        LazyVGrid(columns: columns, spacing: 30) {
                            ForEach(dataModel.filmLists.indices, id: \.self) { index in
                                NavigationLink {
                                    MovieDetailView(movie: $dataModel.filmLists[index], selectedTab: $selectedTab, genreToSearch: $genreToSearch)
                                } label: {
                                    CardMovieView(movie: dataModel.filmLists[index])
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
