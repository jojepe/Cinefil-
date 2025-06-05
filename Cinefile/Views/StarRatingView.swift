// StarRatingView.swift
// Cinefile
//
// Created by Joje on [Data Atual].
//

import SwiftUI

struct StarRatingView: View {
    @Binding var rating: Int // Binding para que a view possa alterar o valor original

    var maximumRating = 5
    var offImage: Image? // Imagem para estrela não selecionada (vazia)
    var onImage = Image(systemName: "star.fill") // Imagem para estrela selecionada (cheia)
    var offColor = Color.gray
    var onColor = Color.rosaNeon // Usando a cor do seu tema

    var body: some View {
        HStack {
            ForEach(1...maximumRating, id: \.self) { number in
                image(for: number)
                    .resizable()
                    .frame(width: 20, height: 20) // Ajuste o tamanho conforme necessário
                    .foregroundColor(number > rating ? offColor : onColor)
                    .onTapGesture {
                        // Se o usuário tocar na mesma estrela que já representa o rating atual,
                        // desmarca tudo (rating = 0). Caso contrário, define o novo rating.
                        if number == rating {
                            rating = 0
                        } else {
                            rating = number
                        }
                    }
            }
        }
    }

    func image(for number: Int) -> Image {
        if number > rating {
            return offImage ?? Image(systemName: "star") // Usa "star" (vazia) se offImage não for fornecida
        } else {
            return onImage
        }
    }
}

// Preview para StarRatingView (opcional, mas útil)
struct StarRatingView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            StarRatingView(rating: .constant(0))
            StarRatingView(rating: .constant(3))
            StarRatingView(rating: .constant(5))
        }
        .padding()
        .background(Color.fundoEscuro) // Para melhor visualização no preview
    }
}
