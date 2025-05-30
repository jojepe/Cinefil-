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
        NavigationStack{
            
            ScrollView {
                
                VStack {
                    
                    Image("logo")
                    
                    LazyVGrid(columns: columns, spacing: 30) {
                        ForEach(dataModel.filmLists, id: \.title) { movie in
                            
                            NavigationLink{
                                
                                MovieDetailView(movie: movie)
                                
                            } label:{
                                CardMovieView(movie: movie)
                                
                            }
                        }
                    }
                    .padding(5)
                }
                .background(LinearGradient(gradient: Gradient(colors: [.fundoEscuro, .fundoClaro]), startPoint: .top, endPoint: .bottom))
                .frame(maxWidth: .infinity)
            }
        }
    }
}

#Preview {
    CatalogView()
}
