//
//  CatalogView.swift
//  Cinefile
//
//  Created by Yasmin Salamon on 29/05/25.
//
import Foundation
import SwiftUI

struct CatalogView: View {
    
    let dataModel = DataModel()
        
    let columns = [
        GridItem(.adaptive(minimum: 100))
        ]
        
    var body: some View {
        ScrollView {
                    LazyVGrid(columns: columns, spacing: 30) {
                        
                        ForEach(dataModel.filmLists, id: \.title) { movie in
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
                                    .frame(width: 120, height: 35, alignment: .topLeading)
                                
                            }
                            // Defina uma ALTURA TOTAL FIXA para o VStack (célula da grade)
                            // Calcule essa altura: altura_imagem + spacing_interno + altura_texto
                            // Ex: 150 (imagem) + 8 (spacing) + 35 (texto) = 193
                            .frame(width: 100, height: 190)
                        }
                    }
                    
                    .padding(.horizontal)
                }
            }
    }

#Preview {
    CatalogView()
}
