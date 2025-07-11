//
//  InicioView.swift
//  Cinefile
//
//  Created by Yasmin Salamon on 05/06/25.
//

import Foundation
import SwiftUI

struct PrincipalView: View {
    
    @Binding var dataModel: DataModel
    @Binding var selectedTab: ContentView.tabIdentifier
    @Binding var genreToSearch: String?
    
    
    let columns = [
        GridItem(.adaptive(minimum: 100))
    ]
    
    // Propriedade computada para obter os índices dos filmes marcados como assistidos
    private var watchedMovieIndices: [Int] {
        dataModel.filmLists.indices.filter { dataModel.filmLists[$0].isWatched }
    }
    
    private var watchListMovieIndices: [Int] {
        dataModel.filmLists.indices.filter { dataModel.filmLists[$0].isOnWatchlist }
    }
    
    var numMovie = ContentView().numeroAleatorio
    
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
                        
                        //seção de recomendações
                        NavigationLink {
                            MovieDetailView(movie: $dataModel.filmLists[numMovie], selectedTab: $selectedTab, genreToSearch: $genreToSearch)
                        } label: {
                            Image("aleatorio")
                                .resizable()
                                .frame(width: 369, height: 159)
                        }

                        
                        //Seção da watchlist
                        VStack(alignment: .leading, spacing: 20) {
                            NavigationLink {
                                ToWatchView(dataModel: $dataModel, selectedTab: $selectedTab, genreToSearch: $genreToSearch)
                            } label: {
                                HStack {
                                    Text("Watchlist")
                                        .font(.title3.bold())
                                        .foregroundStyle(Color.white)
                                        
                                    
                                    Spacer()
                                    Image(systemName: "chevron.right")

                                }
                                .padding()
                            }
                            
                            if watchListMovieIndices.isEmpty {
                                VStack {
                                
                                        NavigationLink {
                                            CatalogView(dataModel: $dataModel, selectedTab: $selectedTab, genreToSearch: $genreToSearch)
                                        } label: {
                                            ZStack {
                                                Rectangle()
                                                    .frame(width: 120, height:180)
                                                    .foregroundStyle(.black)
                                                    .opacity(0.5)
                                                
                                                Text("Adicione filmes que você quer ver")
                                                    .font(.callout)
                                                    .foregroundStyle(Color.gray)
                                                    .padding(.vertical, 40)
                                                    .frame(width: 100)
                                            }
                                        }
                                }
                                .padding(.horizontal)
                            } else {
                                
                                    HStack(spacing: 30) {
                                        ForEach(watchListMovieIndices, id: \.self) { index in
                                            NavigationLink {
                                                MovieDetailView(movie: $dataModel.filmLists[index], selectedTab: $selectedTab, genreToSearch: $genreToSearch)
                                            } label: {
                                                CardMovieView(movie: dataModel.filmLists[index])
                                            }
                                        }
                                    }
                                    .padding(.horizontal, 25)
                                .frame(height: 180)
                            }
                        }
                        
                        //Seção do catálogo
                        VStack(alignment: .leading, spacing: 20) {
                            NavigationLink {
                                CatalogView(dataModel: $dataModel, selectedTab: $selectedTab, genreToSearch: $genreToSearch)
                            } label: {
                                HStack {
                                    Text("Catálogo completo")
                                        .font(.title3.bold())
                                        .foregroundStyle(Color.white)
                                        
                                    
                                    Spacer()
                                    Image(systemName: "chevron.right")

                                }
                                .padding()
                            }
                            HStack(spacing: 30) {
                                ForEach(dataModel.filmLists.indices.prefix(3), id: \.self) { index in
                                    NavigationLink {
                                        MovieDetailView(movie: $dataModel.filmLists[index], selectedTab: $selectedTab, genreToSearch: $genreToSearch)
                                    } label: {
                                        CardMovieView(movie: dataModel.filmLists[index])
                                    }
                                }
                            }
                            .padding(.horizontal, 25)
                        .frame(height: 180)
                            }
                        }
                        Spacer()
                            .frame(height: 90)
                    }
                .background(LinearGradient(gradient: Gradient(colors: [.fundoEscuro, .fundoClaro]), startPoint: .top, endPoint: .bottom).ignoresSafeArea())
                .navigationBarTitleDisplayMode(.inline)
      
                    
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
        }
    }

