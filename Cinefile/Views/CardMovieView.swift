//
//  CardMovieView.swift
//  Cinefile
//
//  Created by Joje on 30/05/25.
//

import SwiftUI

struct CardMovieView: View {
    
    let movie: Movie
    
    var body: some View {
        VStack(spacing: 2) { // Define o espaçamento vertical entre a Imagem e o Texto
            Image(movie.poster)
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 180) // Altura fixa para a imagem
            
            Text(movie.title)
                .font(.caption2)
                .fontWeight(.medium)
                .lineLimit(2) // Limita o texto a no máximo 2 linhas
                .multilineTextAlignment(.leading)
                .frame(width: 120, height: 45, alignment: .topLeading)
                .foregroundStyle(.white)
            
        }
        // Defina uma ALTURA TOTAL FIXA para o VStack (célula da grade)
        // Calcule essa altura: altura_imagem + spacing_interno + altura_texto
        // Ex: 150 (imagem) + 8 (spacing) + 35 (texto) = 193
        .frame(width: 100, height: 190)
    }
}

#Preview {
    CardMovieView(movie: Movie(poster: "monica", title: "Turma Da Mônica: Uma Aventura no Tempo", year: "2007", synopsis: "Franjinha está construindo uma máquina do tempo e precisa reunir moléculas dos quatro elementos: ar, água, fogo e terra. Mônica joga Sansão e, sem querer, acerta o aparelho, espalhando os elementos. Agora a turma precisa consertá-la.", director: "Maurício de Souza", writers: "Mauricio de Sousa, Flávio de Souza, Didi Oliveira, Emerson Bernardo de Abreu", isFavorite: false, isWatched: false, rating: 0))
}
