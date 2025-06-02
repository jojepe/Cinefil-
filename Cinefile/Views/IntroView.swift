//
//  IntroView.swift
//  Cinefile
//
//  Created by Yasmin Salamon on 30/05/25.
//
import SwiftUI

struct IntroView: View {
    
    let introImages = ["intro0", "intro1", "intro2", "intro3", "intro4", "intro5"]
    
    @State private var Index = 0
    @State private var nextView = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image(introImages[Index])
                    .resizable()
                    .ignoresSafeArea()
                
                VStack {
                    
                    Spacer()
                    NavigationLink(destination: ContentView(), isActive: $nextView) {
                                            EmptyView()
                                        }
                    
                    Button {
                        if Index < introImages.count - 1 {
                            Index += 1
                        } else {
                            nextView = true
                        }
                    } label: {
                        Image(systemName: "arrow.forward.circle.fill")
                            .foregroundStyle(.menta)
                            .font(.system(size: 64))
                    }
                  
                }
                .padding(.bottom, 50)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    IntroView()
}
