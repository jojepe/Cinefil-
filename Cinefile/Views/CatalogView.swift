//
//  CatalogView.swift
//  Cinefile
//
//  Created by Yasmin Salamon on 29/05/25.
//
import Foundation
import SwiftUI

struct CatalogView: View {
    let movie: Movie
    
    let data = (1...18).map { "Item \($0)" }
    
    let columns = [
        GridItem(.adaptive(minimum: 100))
        ]
        
    var body: some View {
        ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(data, id: \.self) { item in
                            VStack {
                                Image(movie.poster)
                                    .resizable()
                                    .frame(width: 120, height: 202)
                                
                                Text(movie.title)
                                    .font(.system(size: 12))
                                
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
    }

#Preview {
    CatalogView(movie: Movie(poster: "posterMockUp", title: "Turma Da Mônica: Uma Aventura no Tempo", year: "2007", synopsis: "Franjinha está construindo uma máquina do tempo e precisa reunir moléculas dos quatro elementos: ar, água, fogo e terra. Mônica joga Sansão e, sem querer, acerta o aparelho, espalhando os elementos. Agora a turma precisa consertá-la.", director: "Maurício de Souza", writers: "Mauricio de Sousa, Flávio de Souza, Didi Oliveira, Emerson Bernardo de Abreu"))
}
