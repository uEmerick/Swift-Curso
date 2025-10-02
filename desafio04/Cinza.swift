//
//  Cinza.swift
//  desafio04
//
//  Created by Turma02-4 on 04/07/25.
//

import SwiftUI

struct Cinza: View {
    var body: some View {
        ZStack {
            Color.gray
                .edgesIgnoringSafeArea(.top)
            
            Image(systemName: "paintpalette.fill")
                .resizable()
                .frame(width: 200, height: 200,alignment: .center)
                
           // Circle()
                .frame(width: 250, height: 250)
            
        }    }
}

#Preview {
    Cinza()
}
