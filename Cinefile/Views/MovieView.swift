//
//  MovieView.swift
//  Cinefile
//
//  Created by Joje on 29/05/25.
//

import SwiftUI

struct MovieDetailView: View {
    
    let movie: Movie
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 17){
            
            HStack(alignment: .top){
                
                Image(movie.poster)
                    .resizable()
                    .frame(width: 160, height: 250)
                
                VStack {
                    
                    VStack(alignment: .leading){
                        
                        Text(movie.title)
                            .font(.title3)
                            .bold()
                        
                        Text("Diretor: \(movie.director)")
                            .font(.body)
                        
                        Text("Roteristas: \(movie.writers)")
                            .font(.body)
                        
                        Text("Ano: \(movie.year)")
                            .font(.body)
                    }
                }
                
                VStack {
                    
                    // implement favorito e visto button
                    
                    // implementing rating
                    
                }
            }
            
            Text("Sinopse: \(movie.synopsis)")
        
            Spacer()
                
        }
        .padding()
    }
}


#Preview {
    MovieDetailView(movie: Movie(poster: "land", title: "La La Land", year: "2017", synopsis: "O pianista Sebastian conhece a atriz Mia, e os dois se apaixonam perdidamente. Em busca de oportunidades para suas carreiras na competitiva Los Angeles, os jovens tentam fazer o relacionamento amoroso dar certo, enquanto perseguem fama e sucesso.", director: "Damien Chazelle", writers: "Damien Chazelle", isFavorite: false, isWatched: false, rating: 0))
}
