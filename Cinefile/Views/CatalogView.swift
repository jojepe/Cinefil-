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
            VStack {
                Image("logo")
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(data, id: \.self) { item in
                        VStack {
                            Image(movie.poster)
                                .resizable()
                                .frame(width: 120, height: 202)
                            
                            Text(movie.title)
                                .font(.system(size: 12))
                                .foregroundStyle(.white)
                            
                        }
                    }
                }
                .padding(.horizontal)
            }
            .background(LinearGradient(gradient: Gradient(colors: [.fundoEscuro, .fundoClaro]), startPoint: .top, endPoint: .bottom))
            
        }
    }
}

#Preview {
    CatalogView(movie: Movie(poster: "barbie", title: "Barbie a Princesa e a Plebeia", year: "2004", synopsis: "Uma plebeia, moradora de um vilarejo, é muito parecida com a princesa do reino. Os destinos das duas se cruzam quando a princesa é sequestrada, e a moça humilde usa sua incrível semelhança com ela para tentar salvar das mãos do vilão.", director: "William Lau", writers: "Cliff Ruby, Elana Lesser, Ruth Handler", isFavorite: false, isWatched: false, rating: 0))
}
