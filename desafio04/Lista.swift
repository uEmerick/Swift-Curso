//
//  List.swift
//  desafio04
//
//  Created by Turma02-4 on 04/07/25.
//

import SwiftUI

struct Lista: View {
    var body: some View {
        VStack {
            Text("List")
                                
            List {
                VStack {
                    HStack {
                        Text("Itens")
                        Spacer()
                        Image(systemName: "paintbrush")
                    }
                    HStack {
                        Text("Itens")
                        Spacer()
                        Image(systemName: "paintbrush.pointed")
                    }
                    HStack {
                        Text("Itens")
                        Spacer()
                        Image(systemName: "paintpalette")
                    }
                }
            }
            Spacer()
        }
    }
}

#Preview {
    Lista()
}
