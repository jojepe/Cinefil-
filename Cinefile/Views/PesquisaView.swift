import SwiftUI

struct PesquisaView: View {
    @Binding var dataModel: DataModel
    @State private var searchText = ""

    let columns = [
        GridItem(.adaptive(minimum: 100))
    ]

    var filteredFilmLists: [Movie] {
        if searchText.isEmpty {
            return []
        } else {
            return dataModel.filmLists.filter { movie in
                movie.title.localizedCaseInsensitiveContains(searchText)
            }
        }
    }

    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.fundoEscuro, .fundoClaro]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()

                ScrollView {
                    VStack {
                        Spacer().frame(height: 20)
                        
                        TextField("Pesquisar filmes", text: $searchText)
                            .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
                            .background(Color(.systemGray6)) // Cor de fundo para o TextField
                            .cornerRadius(20)
                            .padding(.horizontal)
                            .padding(.bottom, 20)

                        // 4. Atualizar a LazyVGrid para usar a lista filtrada
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


