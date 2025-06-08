//
//  MovieView.swift
//  Cinefile
//
//  Created by Joje on 29/05/25.
//

import SwiftUI

struct MovieDetailView: View {
    
    @Binding var movie: Movie
    @Binding var selectedTab: ContentView.tabIdentifier
    @Binding var genreToSearch: String?
    
    @Environment(\.dismiss) var dismiss 
    
    var body: some View {
        VStack(alignment: .leading, spacing: 17){
            
            HStack(alignment: .top, spacing: 15){
                
                Image(movie.poster)
                    .resizable()
                    .frame(width: 160, height: 250)
                
                VStack{
                    
                    VStack(alignment: .leading, spacing: 5){
                        
                        Text(movie.title)
                            .font(.title2)
                            .bold()
                            .foregroundStyle(.menta)
                        
                        Text("Diretor: \(movie.director)")
                            .font(.body)
                            .foregroundStyle(.white)
                        
                        Text("Roteristas: \(movie.writers)")
                            .font(.body)
                            .foregroundStyle(.white)
                        
                        Text("Ano: \(movie.year)")
                            .font(.body)
                            .foregroundStyle(.white)
                                          
                        Spacer()
                            .frame(height: 5)
                        
                    }
                }
            }
            
            HStack (spacing: 15){
                VStack (spacing: 10){
                    
                    
                    StarRatingView(rating: $movie.rating)
                        .padding(.vertical, 17)
                        .padding(.horizontal, 15)
                        .overlay {
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.rosaNeon)
                        }
                }
                HStack (alignment: .bottom, spacing: 20) {
                    
                    Button {
                        movie.isFavorite.toggle()
                    }label: {
                        VStack {
                            Image(systemName: movie.isFavorite ? "heart.fill" : "heart")
                                .font(.title3)
                                .foregroundStyle(.rosaNeon)
                            Spacer()
                                .frame(height:2)
                            Text("Favorito")
                                .foregroundStyle(.rosaNeon)
                                .font(.system(size: 8))
                            
                        }
                    }
                    
                    Button {
                        movie.isWatched.toggle()
                    } label: {
                        VStack {
                            // Ícone muda com base no estado de isWatched
                            Image(systemName: movie.isWatched ? "eye.fill" : "eye")
                                .font(.title3)
                                .foregroundStyle(.rosaNeon)
                            Spacer()
                                .frame(height:2)
                            Text("Assistido")
                                .foregroundStyle(.rosaNeon)
                                .font(.system(size:8))
                        }
                    }
                    
                    Button {
                        movie.isOnWatchlist.toggle()
                    } label: {
                        VStack {
                            // Ícone muda com base no estado de isWatched
                            Image(systemName: movie.isOnWatchlist ? "bookmark.fill" : "bookmark")
                                .font(.title3)
                                .foregroundStyle(.rosaNeon)
                            
                            Text("Watchlist")
                                .foregroundStyle(.rosaNeon)
                                .font(.system(size:8))
                        }
                    }
                    
                    
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 15)
                .overlay {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.rosaNeon)
                }
            }
            
            Text("Sinopse: \(movie.synopsis)")
                .foregroundStyle(.white)
        
            HStack{
                ForEach(movie.genres, id: \.self) { genre in
                    Button {
                        genreToSearch = genre
                        
                        dismiss()
                    } label: {
                        Text(genre)
                            .foregroundStyle(.white)
                            .padding(.vertical, 6)
                            .padding(.horizontal, 8)
                            .overlay {
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.white)
                            }
                    }
                }
            }
            
            Spacer()
                
        }
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: [.fundoEscuro, .fundoClaro]), startPoint: .top, endPoint: .bottom))
        
    }
}

//
//#Preview {
//    @State var previewMovie = Movie(
//        poster: "tenenbaums",
//        title: "Os Excêntricos Tenenbaums",
//        year: "2002",
//        synopsis: "Royal e sua esposa Etheline tiveram três filhos muito diferentes entre si, mas igualmente bem-sucedidos. Quando Etheline resolve se casar com outro, o irresponsável e excêntrico Royal resolve lutar por seu amor reunindo toda a família.",
//        director: "Wes Anderson",
//        writers: "Wes Anderson, Owen Wilson",
//        isFavorite: false,
//        isWatched: false,
//        isOnWatchlist: false,
//        rating: 0,
//        genres: ["Animação", "Comédia", "Musical"]
//    )
//    
//    @State var previewSelectedTab: ContentView.tabIdentifier = .perfil
//    @State var previewGenreToSearch: String? = nil
//
//    MovieDetailView(
//        movie: $previewMovie,
//        selectedTab: $previewSelectedTab,
//        genreToSearch: $previewGenreToSearch
//    )
//    .preferredColorScheme(.dark)
//}
