//
//  LogoView.swift
//  MessengerClone
//
//  Created by Turdesan Csaba on 05/02/2024.
//

import SwiftUI

struct LogoView: View {
    @State private var isAnimate: Bool = false
    
    var body: some View {
        VStack{
            Circle()
                .frame(height: 100)
                .foregroundStyle(LinearGradient(colors: [.blue, .purple, .red], startPoint: .bottomLeading, endPoint: .topTrailing))
                .offset(x: 0 ,y: isAnimate ? -10 : 10)
                .overlay{
                    Image(systemName: "chevron.right")
                        .font(.system(size: 50))
                        .foregroundStyle(.white)
                        .offset(x: isAnimate ? 10 : -100,y: -10)
                        .foregroundStyle(.green)
                        .rotationEffect(.degrees(isAnimate ? -40 : 40))
                      
                }
        }
        .onAppear{
            withAnimation(.easeOut(duration: 0.5)) {
                isAnimate = true
            }
        }
        .onDisappear{
            withAnimation {
                isAnimate = false
            }
        }
    }
}

#Preview {
    LogoView()
        .preferredColorScheme(.dark)
}
