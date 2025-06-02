//
//  CatalogView.swift
//  Cinefile
//
//  Created by Yasmin Salamon on 29/05/25.
//
import Foundation
import SwiftUI

struct CatalogView: View {
    
    @Binding var dataModel: DataModel
    
    let columns = [
        GridItem(.adaptive(minimum: 100))
    ]
    
    var body: some View {
        NavigationStack{
            
            ZStack{
                LinearGradient(gradient: Gradient(colors: [.fundoEscuro, .fundoClaro]), startPoint: .top, endPoint: .bottom)
                ScrollView {
                    
                    VStack {
                        Spacer()
                            .frame(height: 80)
                        
                        Image("logo")
                            .resizable()
                            .frame(width:74, height:55)
                            .scaledToFit()
                        
                        LazyVGrid(columns: columns, spacing: 30) {
                            ForEach(dataModel.filmLists.indices, id: \.self) { index in
                                NavigationLink {
                                    // 2. Crie um Binding para o elemento específico do array
                                    //    usando o índice. `$dataModel` nos dá um Binding<DataModel>,
                                    //    e `.filmLists[index]` acessa o Binding para o Movie.
                                    MovieDetailView(movie: $dataModel.filmLists[index])
                                } label: {
                                    // Para CardMovieView, você passa o valor imutável (o movie em si),
                                    // a menos que CardMovieView também precise modificar o filme.
                                    CardMovieView(movie: dataModel.filmLists[index])
                                }
                            }
                        }
                        .padding(10)
                        
                        Spacer()
                            .frame(height: 90)
                    }
                    
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
        }
    }
}
