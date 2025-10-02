//
//  Azul.swift
//  desafio04
//
//  Created by Turma02-4 on 04/07/25.
//

import SwiftUI

struct Azul: View {
    var body: some View {
        ZStack {
            Color.blue
                .edgesIgnoringSafeArea(.top)
            
            Image(systemName: "paintbrush.pointed.fill")
                .resizable()
                .frame(width: 200, height: 200,alignment: .center)
                
           // Circle()
                .frame(width: 250, height: 250)
            
        }
    }
}

#Preview {
    Azul()
}
