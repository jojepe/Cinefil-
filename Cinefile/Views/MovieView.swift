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
    MovieDetailView(movie: Movie(poster: "posterMockUp", title: "Turma Da Mônica: Uma Aventura no Tempo", year: "2007", synopsis: "Franjinha está construindo uma máquina do tempo e precisa reunir moléculas dos quatro elementos: ar, água, fogo e terra. Mônica joga Sansão e, sem querer, acerta o aparelho, espalhando os elementos. Agora a turma precisa consertá-la.", director: "Maurício de Souza", writers: "Mauricio de Sousa, Flávio de Souza, Didi Oliveira, Emerson Bernardo de Abreu"))
}
