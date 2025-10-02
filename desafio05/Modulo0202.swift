//
//  Modulo0202.swift
//  desafio05
//
//  Created by Turma02-4 on 04/07/25.
//

import SwiftUI

struct Modulo0202: View {
    let receivedName: String
    var body: some View {
        ZStack {
            Color.gray
                .edgesIgnoringSafeArea(.top)
            VStack {
                Spacer()
                HStack {
                    VStack {
                            Text("Volte,")
                                .foregroundColor(.white)
                    
                            Text("\(receivedName)")
                                .foregroundColor(.white)
                    }
                }.padding(.horizontal, 40)
                    .padding(.vertical, 40)
                    .background(.pink)
                    .cornerRadius(10)
                Spacer()
            }
        }
    }
}

#Preview {
    Modulo0202(receivedName: "")
}
