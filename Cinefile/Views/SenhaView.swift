//
//  LoginView 2.swift
//  Cinefile
//
//  Created by Yasmin Salamon on 30/05/25.
//


import SwiftUI

struct SenhaView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationStack {
                
            VStack(alignment: .center, spacing: 24) {
                Spacer()
                
                Image("logotipo")
                    .resizable()
                    .frame(width: 208, height: 130)
                
               
                    
                    VStack (alignment: .leading){
                        Text("E-mail")
                            .foregroundStyle(.menta)
                            .font(.title3.bold())
                        
                        
                        TextField(
                            "",
                            text: $email,
                            prompt: Text("Insira o seu e-mail")
                                .foregroundStyle(.white)
                                .font(.caption)
                        )
                        .padding()
                        .overlay {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.white)
                        }
                        .textContentType(.emailAddress)
                    }
                    
                    VStack (alignment: .leading){
                        Text("Senha")
                            .foregroundStyle(.menta)
                            .font(.title3.bold())
                        
                        TextField(" ",
                            text: $password,
                            prompt: Text("Insira sua senha")
                                .foregroundStyle(.white)
                                .font(.caption) )
                        .padding()
                        .overlay {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.white)
                        }
                        .textContentType(.emailAddress)
                    }
                    
                    NavigationLink(destination: ContentView()) {
                        Text("Fazer login")
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .background(.black)
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                    
                    Text("Não tem uma conta? Faça seu cadastro")
                        .foregroundStyle(.white)
                }
            
                
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(
                        Gradient(colors: [.fundoEscuro, .fundoClaro])
                    )
                }
            }
        }


#Preview {
    SenhaView()
}
