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
    MovieDetailView(movie: Movie(poster: "tenenbaums", title: "Os Excêntricos Tenenbaums", year: "2002", synopsis: "Royal e sua esposa Etheline tiveram três filhos muito diferentes entre si, mas igualmente bem-sucedidos. Quando Etheline resolve se casar com outro, o irresponsável e excêntrico Royal resolve lutar por seu amor reunindo toda a família.", director: "Wes Anderson", writers: "Wes Anderson, Owen Wilson", isFavorite: false, isWatched: false, rating: 0))
}
