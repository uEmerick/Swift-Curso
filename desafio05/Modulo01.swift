//
//  Modulo01.swift
//  desafio05
//
//  Created by Turma02-4 on 04/07/25.
//

import SwiftUI

struct Modulo01: View {
    @State  var name: String = ""
    @State  var rename: String = ""
    var body: some View {
        ZStack {
            Color.gray
                .edgesIgnoringSafeArea(.top)
            VStack {
                Spacer()
                HStack {
                    VStack {
                        HStack {
                            Text("Nome:")
                                .foregroundColor(.white)
                            TextField("", text: $name)
                                .frame(width: 90)
                                .foregroundColor(.white)
                        }
                        HStack {
                            Text("Sobrenome:")
                                .foregroundColor(.white)
                            TextField("", text: $rename)
                                .frame(width: 90)
                                .foregroundColor(.white)
                        }
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
    Modulo01()
}
