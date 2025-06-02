import SwiftUI

struct PesquisaView: View {
    @Binding var dataModel: DataModel
    @State private var searchText = ""
    
   // let showGenre: Bool = true

    let columns = [
        GridItem(.adaptive(minimum: 100))
    ]

    var filteredFilmLists: [Movie] {
        if searchText.isEmpty {
            return []
        } else {
            return dataModel.filmLists.filter { movie in
                movie.title.localizedCaseInsensitiveContains(searchText) || movie.genres.contains { genre in 
                    genre.localizedCaseInsensitiveContains(searchText)
                }
            }
        }
    }

    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.fundoEscuro, .fundoClaro]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()

                ScrollView {
                    VStack (alignment: .leading) {
                        Spacer().frame(height: 20)
                        
                        TextField("Pesquisar filmes", text: $searchText)
                            .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
                            .background(Color(.systemGray6)) // Cor de fundo para o TextField
                            .cornerRadius(20)
                            .padding(.horizontal)
                            .padding(.bottom, 20)
                        
                        
                        // 4. Atualizar a LazyVGrid para usar a lista filtrada
                        if searchText.isEmpty{
                            VStack (alignment: .leading){
                                Text("Gêneros")
                                    .font(.title3.bold())
                                    .foregroundStyle(.white)
                                    .padding(20)

                                HStack{
                                    
                                    Text("Ação")
                                        .foregroundStyle(.white)
                                        .padding(.vertical, 6)
                                        .padding(.horizontal, 8)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(Color.white)
                                        }
                                    
                                    Text("Animação")
                                        .foregroundStyle(.white)
                                        .padding(.vertical, 6)
                                        .padding(.horizontal, 8)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(Color.white)
                                        }
                                    
                                    Text("Aventura")
                                        .foregroundStyle(.white)
                                        .padding(.vertical, 6)
                                        .padding(.horizontal, 8)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(Color.white)
                                        }
                                    
                                    Text("Comédia")
                                        .foregroundStyle(.white)
                                        .padding(.vertical, 6)
                                        .padding(.horizontal, 8)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(Color.white)
                                        }
                                }
                                HStack{
                                    
                                    Text("Drama")
                                        .foregroundStyle(.white)
                                        .padding(.vertical, 6)
                                        .padding(.horizontal, 8)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(Color.white)
                                        }
                                    
                                    Text("Esporte")
                                        .foregroundStyle(.white)
                                        .padding(.vertical, 6)
                                        .padding(.horizontal, 8)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(Color.white)
                                        }
                                    
                                    Text("Fantasia")
                                        .foregroundStyle(.white)
                                        .padding(.vertical, 6)
                                        .padding(.horizontal, 8)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(Color.white)
                                        }
                                }
                                HStack{
                                    Text("Ficção científica")
                                        .foregroundStyle(.white)
                                        .padding(.vertical, 6)
                                        .padding(.horizontal, 8)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(Color.white)
                                            
                                        }
                                            Text("Musical")
                                                .foregroundStyle(.white)
                                                .padding(.vertical, 6)
                                                .padding(.horizontal, 8)
                                                .overlay {
                                                    RoundedRectangle(cornerRadius: 12)
                                                        .stroke(Color.white)
                                                }
                                        
                                }
                            }
                            .padding()
                        }
                        
                        if filteredFilmLists.isEmpty && !searchText.isEmpty {
                            Text("Nenhum filme encontrado para \"\(searchText)\".")
                                .foregroundColor(.white) // Ou uma cor adequada para seu tema
                                .padding(.top, 30)
                            
                        } else if filteredFilmLists.isEmpty && searchText.isEmpty && dataModel.filmLists.isEmpty {
                            Text("Nenhum filme na lista.")
                                .foregroundColor(.white)
                                .padding(.top, 30)
                        }
                        else {
                            LazyVGrid(columns: columns, spacing: 30) {
                                ForEach(filteredFilmLists) { movieInFilteredList in

                                    if let originalIndex = dataModel.filmLists.firstIndex(where: { $0.id == movieInFilteredList.id }) {
                                        NavigationLink {
                                            MovieDetailView(movie: $dataModel.filmLists[originalIndex])
                                        } label: {
                                            CardMovieView(movie: movieInFilteredList)
                                        }
                                    }
                                }
                            }
                            .padding(.horizontal, 5)
                        }
                        Spacer()
                    }
                }
            }
        }
    }
}

#Preview {
    PesquisaView(dataModel: .constant(DataModel()))
}


