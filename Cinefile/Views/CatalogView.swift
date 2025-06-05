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
    
    var body: some View {
        NavigationStack{

            ZStack{
                LinearGradient(gradient: Gradient(colors: [.fundoEscuro, .fundoClaro]), startPoint: .top, endPoint: .bottom)
                ScrollView {
                    
                    VStack {
                        Spacer()
                            .frame(height: 80)
                        
                        Image("logo")
                            .resizable()
                            .frame(width:74, height:55)
                            .scaledToFit()
                        
                        //seção de recomendações
                        
                        
                        //Seção da watchlist
                        VStack(alignment: .leading, spacing: 20) {
                            Button {
                                //ação
                            } label: {
                                HStack {
                                    Text("Atividade recente")
                                        .font(.title3.bold())
                                        .foregroundStyle(Color.white)
                                        
                                    
                                    Spacer()
                                    Image(systemName: "chevron.right")

                                }
                                .padding()
                            }
                            
                            if watchedMovieIndices.isEmpty {
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
                                     
                                    Spacer()
                                }
                                .padding(.horizontal)
                            } else {
                                
                                    HStack(spacing: 30) {
                                        ForEach(watchedMovieIndices, id: \.self) { index in
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
