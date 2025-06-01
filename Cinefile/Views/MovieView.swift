//
//  MovieView.swift
//  Cinefile
//
//  Created by Joje on 29/05/25.
//

import SwiftUI

struct MovieDetailView: View {
    
    @Binding var movie: Movie
    
    var body: some View {
        VStack(alignment: .leading, spacing: 17){
            
            HStack(alignment: .top, spacing: 10){
                
                Image(movie.poster)
                    .resizable()
                    .frame(width: 160, height: 250)
                
                VStack{
                    
                    VStack(alignment: .leading, spacing: 10){
                        
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
                            .frame(height: 3)
                        
                        HStack {
                            
                            Spacer()
                                .frame(width: 20)
                            
                            HStack (spacing: 50) {
                                
                                Button {
                                    movie.isFavorite.toggle()
                                    }label: {
                                        VStack {
                                            Image(systemName: movie.isFavorite ? "heart.fill" : "heart")
                                                .font(.title2)
                                                .foregroundStyle(.rosaNeon)
                                            
                                            Text("Favorito")
                                                .foregroundStyle(.rosaNeon)
                                                .font(.footnote)
                                        
                                    }
                                }
                                
                                Button {
                                    movie.isWatched.toggle()
                                } label: {
                                    VStack {
                                        // Ícone muda com base no estado de isWatched
                                        Image(systemName: movie.isWatched ? "eye.fill" : "eye")
                                            .font(.title2)
                                            .foregroundStyle(.rosaNeon)
                                        
                                        Text("Assistido")
                                            .foregroundStyle(.rosaNeon)
                                            .font(.footnote)
                                    }
                                }
                                
                                
                            }
                            .padding(10)
                            .overlay {
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.rosaNeon)
                            }
                        }
                    }
                }
            }
            
            Text("Sinopse: \(movie.synopsis)")
                .foregroundStyle(.white)
        
            Text("Inserir tags")
                .foregroundStyle(.white)
            
            Spacer()
                
        }
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: [.fundoEscuro, .fundoClaro]), startPoint: .top, endPoint: .bottom))
        
    }
}


#Preview {
    MovieDetailView(movie: .constant(Movie(poster: "tenenbaums", title: "Os Excêntricos Tenenbaums", year: "2002", synopsis: "Royal e sua esposa Etheline tiveram três filhos muito diferentes entre si, mas igualmente bem-sucedidos. Quando Etheline resolve se casar com outro, o irresponsável e excêntrico Royal resolve lutar por seu amor reunindo toda a família.", director: "Wes Anderson", writers: "Wes Anderson, Owen Wilson", isFavorite: false, isWatched: false, rating: 0)))
}
