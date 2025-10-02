//
//  BrushView.swift
//  desafio04
//
//  Created by Turma02-4 on 04/07/25.
//

import SwiftUI

struct Rosa: View {
    var body: some View {
        ZStack {
            Color.pink
                .edgesIgnoringSafeArea(.top)
            
            
            Image(systemName: "paintbrush.fill")
                .resizable()
                .frame(width: 200, height: 200,alignment: .center)
            
        }
       
    }
}

#Preview {
    Rosa()
}
