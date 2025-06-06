//
//  SettingsView.swift
//  Cinefile
//
//  Created by Yasmin Salamon on 06/06/25.
//

import SwiftUI
import Foundation

struct SettingsView : View {
    var body: some View {
        VStack {
            VStack (spacing: 12){
                Image("profile") // Certifique-se que "profile" existe no seu Asset Catalog
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.menta.opacity(0.8), lineWidth: 2)) // Borda sutil
                
                Text("spirit_lover_S2") // Placeholder
                    .font(.title2.bold())
                    .foregroundStyle(Color.menta)
                
                Text("EU AMO SPIRIT!!!!!") // Placeholder
                    .font(.subheadline)
                    .foregroundStyle(Color.white.opacity(0.7))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 30) // Limita a largura da bio
            }
            .frame(maxWidth: .infinity) // Centraliza o conteúdo do VStack de perfil
            .padding(.top, 20)
            
        }
        .background(LinearGradient(gradient: Gradient(colors: [.fundoEscuro, .fundoClaro]), startPoint: .top, endPoint: .bottom)
        .ignoresSafeArea())
        .navigationBarTitleDisplayMode(.inline)
    }
    
}


#Preview {
    SettingsView()
}
