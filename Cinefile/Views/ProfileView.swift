//
//  ProfileView.swift
//  Cinefile
//
//  Created by Yasmin Salamon on 30/05/25.
//

import SwiftUI

struct ProfileView: View {
    
    let movie: Movie
    
    var body: some View {
            VStack (spacing: 10) {
                Image("profile")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                
                Text("seu usuário aqui")
                    .font(.title2)
                    .foregroundStyle(.menta)
                
                Text("bio aqui")
                    .foregroundStyle(.white)
                
                
                Text("Filmes favoritos")
                    .foregroundStyle(.white)
                
                ScrollView {
                    HStack {
                        Image("kiki")
                            .resizable()
                            .frame (width: 120, height: 202)
                        
                    }
                }
                
                Text("Atividade recente")
                    .foregroundStyle(.white)
                
                ScrollView {
                    HStack {
                        Image("kiki")
                            .resizable()
                            .frame (width: 120, height: 202)
                        
                    }
                }
                
                Spacer()
                
            }
            .frame(maxWidth: .infinity)
            .background(LinearGradient(gradient: Gradient(colors: [.fundoEscuro, .fundoClaro]), startPoint: .top, endPoint: .bottom))
    }
}

#Preview {
    ProfileView(movie: Movie(poster: "land", title: "La La Land", year: "2017", synopsis: "O pianista Sebastian conhece a atriz Mia, e os dois se apaixonam perdidamente. Em busca de oportunidades para suas carreiras na competitiva Los Angeles, os jovens tentam fazer o relacionamento amoroso dar certo, enquanto perseguem fama e sucesso.", director: "Damien Chazelle", writers: "Damien Chazelle", isFavorite: false, isWatched: false, rating: 0))
}
