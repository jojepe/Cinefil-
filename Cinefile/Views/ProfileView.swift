//
//  ProfileView.swift
//  Cinefile
//
//  Created by Yasmin Salamon on 30/05/25.
//

import SwiftUI

struct ProfileView: View {
    
    @Binding var dataModel: DataModel
    @Binding var selectedTab: ContentView.tabIdentifier
    @Binding var genreToSearch: String?

    // Propriedade computada para obter os índices dos filmes marcados como favoritos
    private var favoriteMovieIndices: [Int] {
        dataModel.filmLists.indices.filter { dataModel.filmLists[$0].isFavorite }
    }

    // Propriedade computada para obter os índices dos filmes marcados como assistidos
    private var watchedMovieIndices: [Int] {
        dataModel.filmLists.indices.filter { dataModel.filmLists[$0].isWatched }
    }

    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) { // ScrollView principal para toda a tela
                VStack(alignment: .leading, spacing: 25) { // VStack principal da tela
                    
                    // Seção de Informações do Perfil (centralizada)
                    HStack {
                        Spacer()
                        Button {
                            //ação das configurações
                        } label: {
                            Image(systemName: "gearshape")
                        }
                    }
                    .padding()
                    
                    VStack(spacing: 12) {

                        Image("profile") // Certifique-se que "profile" existe no seu Asset Catalog
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.menta.opacity(0.8), lineWidth: 2)) // Borda sutil

                        Text("spirit_lover_S2") // Placeholder
                            .font(.title2.bold())
                            .foregroundStyle(Color.menta)

                        Text("EU AMO SPIRIT!!!!!") // Placeholder
                            .font(.subheadline)
                            .foregroundStyle(Color.white.opacity(0.7))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 30) // Limita a largura da bio
                    }
                    .frame(maxWidth: .infinity) // Centraliza o conteúdo do VStack de perfil
                    .padding(.top, 20)

                    // Seção Filmes Favoritos
                    VStack(alignment: .leading, spacing: 20) {
                        NavigationLink {
                            FavoritosView(dataModel: $dataModel, selectedTab: $selectedTab, genreToSearch: $genreToSearch)
                        } label: {
                            HStack{
                                Text("Filmes favoritos")
                                    .font(.title3.bold())
                                    .foregroundStyle(Color.white)
                               
                                Spacer()
                                Image(systemName: "chevron.right")
                            }
                            .padding()
                        }

                        if favoriteMovieIndices.isEmpty {
                            ZStack {
                                Rectangle()
                                    .frame(width: 120, height:180)
                                    .foregroundStyle(.black)
                                    .opacity(0.5)
                               Text("Adicione seus filmes favoritos")
                                   .font(.callout)
                                   .foregroundStyle(Color.gray)
                                   .padding(.vertical, 40)
                                   .frame(width: 100)
                                Spacer()
                            }
                            .padding(.horizontal)
                        } else {
                            
                                HStack(spacing: 30) { // Espaçamento entre os cards
                                    ForEach(favoriteMovieIndices, id: \.self) { index in
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

                    // Seção Atividade Recente
                    VStack(alignment: .leading, spacing: 20) {
                        NavigationLink {
                            AssistidosView(dataModel: $dataModel, selectedTab: $selectedTab, genreToSearch: $genreToSearch)
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
                                 
                                Text("Adicione seus filmes assistidos")
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
                    
                }
                .padding(.bottom, 30)
            }
            .background(LinearGradient(gradient: Gradient(colors: [.fundoEscuro, .fundoClaro]), startPoint: .top, endPoint: .bottom).ignoresSafeArea())
            .navigationBarTitleDisplayMode(.inline)
  
        }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    @State static var previewDataModel: DataModel = DataModel(filmLists: [
        Movie(poster: "tenenbaums", title: "Os Excêntricos Tenenbaums (Fav)", year: "2002", synopsis: "...", director: "Wes Anderson", writers: "Wes Anderson", isFavorite: true, isWatched: true, rating: 5),
        Movie(poster: "land", title: "La La Land (Assistido)", year: "2017", synopsis: "...", director: "Damien Chazelle", writers: "Damien Chazelle", isFavorite: true, isWatched: true, rating: 4),
        Movie(poster: "monica", title: "Moonrise Kingdom (Fav)", year: "2012", synopsis: "...", director: "Wes Anderson", writers: "Wes Anderson", isFavorite: true, isWatched: false, rating: 5),
    ])
    
    @State static var previewSelectedTab: ContentView.tabIdentifier = .perfil // Use a opção correta aqui
    @State static var previewGenreToSearch: String? = nil

    static var previews: some View {
        ProfileView(
            dataModel: $previewDataModel,
            selectedTab: $previewSelectedTab,
            genreToSearch: $previewGenreToSearch
        )
        .preferredColorScheme(.dark)
    }
}
