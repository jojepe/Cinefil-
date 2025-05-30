//
//  ProfileView.swift
//  Cinefile
//
//  Created by Yasmin Salamon on 30/05/25.
//

import SwiftUI

struct ProfileView: View {
    
    let dataModel = DataModel()
    
    var body: some View {
        NavigationStack {
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
                    .font(.caption)
                
                VStack (alignment: .leading){ // filmes favs
                    Text("Filmes favoritos")
                        .foregroundStyle(.white)
                        .font(.title3 .bold())
                    
                    ScrollView (.horizontal) {
                        HStack (spacing: 30) {
                            ForEach (dataModel.filmLists, id: \.title) { movie in
                                
                                NavigationLink {
                                    MovieDetailView(movie: movie)
                                } label: {
                                    CardMovieView(movie: movie)
                                }
                            }
                        }
                    }
                }
                
                VStack (alignment: .leading) {
                    Text("Atividade recente")
                        .foregroundStyle(.white)
                        .font(.title3 .bold())
                    
                    ScrollView (.horizontal) {
                        HStack (spacing: 30) {
                            ForEach (dataModel.filmLists, id: \.title) { movie in
                                
                                NavigationLink {
                                    MovieDetailView(movie: movie)
                                } label: {
                                    CardMovieView(movie: movie)
                                }
                            }
                        }
                    }
                }
                
                Spacer()
                
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(LinearGradient(gradient: Gradient(colors: [.fundoEscuro, .fundoClaro]), startPoint: .top, endPoint: .bottom))
        }
    }
}

#Preview {
    ProfileView()
}
