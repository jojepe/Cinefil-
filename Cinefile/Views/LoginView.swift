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
                
                VStack(spacing: 24) {
                    Spacer()
                    Image("logo")
                        .offset(y: showModal ? -150 : 0)
                    
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
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(
                        Gradient(colors: [.fundoEscuro, .fundoClaro])
                    )
                    // Uncomment when SignInModel is ready:
                    // .sheet(isPresented: $showModal) {
                    //     SignInModel()
                    //         .presentationDetents([.height(516)])
                    // }
                }
            }
        }


#Preview {
    LoginView()
}
