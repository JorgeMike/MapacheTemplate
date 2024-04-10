//
//  HomeView.swift
//  MapacheTemplate
//
//  Created by CEDAM 13 on 08/04/24.
//

import SwiftUI

struct AIView: View {
    @State private var messageText: String = ""
    @State private var messages: [String] = []
    
    var body: some View {
        VStack {
            // Chat messages display area
            ScrollView {
                ForEach(messages, id: \.self) { message in
                    Text(message)
                        .padding()
                        .background(Color.gray.opacity(0.2)) // Fondo para los mensajes
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
            }

            // Input area
            HStack {
                TextField("Escribe un mensaje...", text: $messageText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button(action: sendMessage) {
                    Text("Enviar")
                }
                .padding()
            }
            .padding(.bottom, 80) // Agrega un margen en la parte inferior
        }
    }
    
    func sendMessage() {
        print("Mensaje enviado: \(messageText)")
        messageText = ""
    }
}

struct AI_Previews: PreviewProvider {
    static var previews: some View {
        AIView()
    }
}

