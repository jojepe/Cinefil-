//
//  LoginView.swift
//  Cinefile
//
//  Created by Yasmin Salamon on 30/05/25.
//
import SwiftUI

struct LoginView: View {
    
    @State private var showModal = false
    
    var body: some View {
        NavigationStack {
            VStack {
                
                
                Image("introImage")
                    .resizable()
                    .scaledToFit()
                
                VStack(spacing: 24) {
                    
                    NavigationLink(destination: SenhaView()) {
                        Text("Fazer login")
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .background(.black)
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                    
                    VStack{
                        
                        NavigationLink(destination: CadastroView()) {
                            Text("Criar uma conta")
                                .frame(maxWidth: .infinity, maxHeight: 50)
                                .background(.rosaNeon)
                                .foregroundStyle(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                        }
                    }
                }
                .padding()
            }
        
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Gradient(colors: [.fundoEscuro, .fundoClaro])
            )
                
                }
            }
        }


#Preview {
    LoginView()
}
