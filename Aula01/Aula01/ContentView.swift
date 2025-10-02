//
//  ContentView.swift
//  Aula01
//
//  Created by Turma02-4 on 02/07/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                    Rectangle()
                    .fill(.red)
                        .frame(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                        

                
                Spacer()
    
                    Rectangle()
                    .fill(.blue)
                        .frame(width: 100.0, height: 100.0)
                       
            
            }
            
            Spacer()
            
            
            HStack {
                    Rectangle()
                    .fill(.green)
                    .frame(width: 100.0, height: 100.0)
                   
                
                Spacer()
                    Rectangle()
                    .fill(.yellow)
                    .frame(width: 100.0, height: 100.0)
                  
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
