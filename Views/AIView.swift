import SwiftUI

struct AIView: View {
    @State private var messageText: String = ""
    @State private var messages: [(text: String, isUser: Bool)] = [
        (text: "Hola, ¿puedes mostrarme las estadísticas de ventas de esta semana?", isUser: true),
        (text: "¡Claro! Esta semana tuviste un total de 120 ventas.", isUser: false),
        (text: "¿Y cuál ha sido el producto más vendido?", isUser: true),
        (text: "El producto más vendido esta semana ha sido el 'Café de grano especial'.", isUser: false),
        (text: "Genial, ¿cuál ha sido la ganancia total este mes?", isUser: true),
        (text: "La ganancia total este mes asciende a $5,400.", isUser: false)
    ]
    
    var body: some View {
        VStack {
            header
            chatArea
            inputArea
        }
    }
    
    var header: some View {
        HStack {
            Circle()
                .frame(width: 40, height: 40)
                .overlay(
                    Image(systemName: "person.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.white)
                        .frame(width: 25, height: 25)
                )
                .clipShape(Circle())
                .foregroundColor(.blue)
            
            Text("Asistente Virtual")
                .bold()
            
            Spacer()
            
            HStack(spacing: 4) {
                ForEach(0..<3) { _ in
                    Circle()
                        .frame(width: 8, height: 8)
                        .foregroundColor(Color.gray)
                }
            }
        }
        .padding()
        .background(Color.white)
    }
    
    var chatArea: some View {
        ScrollView {
            ForEach(messages, id: \.text) { message in
                messageBubble(for: message)
            }
        }
    }
    
    func messageBubble(for message: (text: String, isUser: Bool)) -> some View {
        HStack {
            if message.isUser {
                Spacer()
                Text(message.text)
                    .padding()
                    .background(Color.blue.opacity(0.2))
                    .cornerRadius(10)
                    .padding(.horizontal)
            } else {
                Text(message.text)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .padding(.horizontal)
                Spacer()
            }
        }
    }
    
    var inputArea: some View {
        HStack {
            TextField("Escribe un mensaje...", text: $messageText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button(action: sendMessage) {
                Text("Enviar")
            }
            .padding()
        }
        .padding(.bottom, 50)
    }
    
    func sendMessage() {
        if !messageText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            messages.append((text: messageText, isUser: true))
            messages.append((text: "Lo siento, no tengo más información actualmente.", isUser: false))
            messageText = ""
        }
    }
}

struct AI_Previews: PreviewProvider {
    static var previews: some View {
        AIView()
    }
}
