import SwiftUI

struct PesquisaView: View {
    
    @Binding var dataModel: DataModel
    @State private var searchText = ""
    @FocusState private var isSearchFieldFocused: Bool
    
    // let showGenre: Bool = true
    
    var initialSearchText: String?
    var onSearchHandled: (() -> Void)?
    
    let columnsSearch = [
        GridItem(.adaptive(minimum: 100))
    ]
    
    let rowsGenres = [
        GridItem(.adaptive(minimum: 100)),
        GridItem(.adaptive(minimum: 100)),
        GridItem(.adaptive(minimum: 100)),
        GridItem(.adaptive(minimum: 100)),
        GridItem(.adaptive(minimum: 100)),

    ]
    
    var genresList: [String] {
        Set(dataModel.filmLists.flatMap(\.genres)).sorted()
    }
    
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
                        
                        HStack {
                            Image(systemName: "magnifyingglass")
                            
                            TextField("Pesquisar filmes", text: $searchText)
                                .focused($isSearchFieldFocused)
                            
                            Button {
                                searchText = ""
                            } label: {
                                Image(systemName: "x.circle.fill")
                                    .frame(width: 20, height: 20)
                                .foregroundStyle(.black)
                            }
                                .opacity(searchText.isEmpty ? 0 : 1)
                        }
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
                                
                                LazyHGrid(rows: rowsGenres, alignment: .top, spacing: 20){
                                    ForEach(genresList, id: \.self) { genre in
                                        Button {
                                            searchText = genre
                                        } label: {
                                            Text(genre)
                                                .foregroundStyle(.white)
                                                .padding(.vertical, 6)
                                                .padding(.horizontal, 8)
                                                .overlay {
                                                    RoundedRectangle(cornerRadius: 12)
                                                        .stroke(Color.white)
                                                }
                                        }
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
                            LazyVGrid(columns: columnsSearch, spacing: 30) {
                                ForEach(filteredFilmLists) { movieInFilteredList in
                                    
                                    if let originalIndex = dataModel.filmLists.firstIndex(where: { $0.id == movieInFilteredList.id }) {
                                        NavigationLink {
                                            MovieDetailView(movie: $dataModel.filmLists[originalIndex], selectedTab: .constant(.pesquisa), genreToSearch: .constant(nil))
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
        .onAppear {
            if let initialText = initialSearchText, !initialText.isEmpty {
                searchText = initialText
                onSearchHandled?() // Chama o callback para limpar o genreToSearch em ContentView
            }
        }
    }
}

#Preview {
    PesquisaView(dataModel: .constant(DataModel()), initialSearchText: "Ação")
}


