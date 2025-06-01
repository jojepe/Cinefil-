//
//  PesquisaView.swift
//  Cinefile
//
//  Created by Joje on 01/06/25.
//

import Foundation
import SwiftUI

struct PesquisaView: View {
    
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
                            .frame(height: 60)
                        
                        Image("logo")
                        
                        LazyVGrid(columns: columns, spacing: 30) {
                            ForEach(dataModel.filmLists.indices, id: \.self) { index in
                                NavigationLink {
                                    MovieDetailView(movie: $dataModel.filmLists[index])
                                } label: {
                                    CardMovieView(movie: dataModel.filmLists[index])
                                }
                            }
                        }
                        .padding(5)
                    }
                    
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
        }
    }
}


#Preview {
    // Cria uma struct container para o Preview
    struct PreviewContainer: View {
        // Usa @State para criar uma fonte de verdade para DataModel
        @State var sampleDataModel = DataModel() // Inicialize com dados de exemplo se necessário

        var body: some View {
            PesquisaView(dataModel: $sampleDataModel)
        }
    }
    
    return PreviewContainer()
}
