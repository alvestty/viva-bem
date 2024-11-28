//
//  ContentView.swift
//  opinion fit
//
//  Created by user on 14/11/24.
//
    
import SwiftUI

// Modelo para a Dica
struct Dica: Identifiable {
    var id = UUID()
    var titulo: String
    var texto: String
}

// Lista de Dicas
let dicas = [
    Dica(titulo: "Beba Água Regularmente", texto: "Manter-se hidratado é essencial para o bom funcionamento do organismo e auxilia na digestão."),
    Dica(titulo: "Inclua Vegetais no Seu Prato", texto: "Vegetais fornecem fibras, vitaminas e minerais, essenciais para uma alimentação equilibrada."),
    Dica(titulo: "Evite Alimentos Ultraprocessados", texto: "Alimentos ultraprocessados contêm muitos conservantes e aditivos prejudiciais à saúde."),
    Dica(titulo: "Consuma Frutas Todos os Dias", texto: "Frutas são ricas em vitaminas, fibras e antioxidantes que ajudam a prevenir doenças."),
    Dica(titulo: "Prefira Grãos Integrais", texto: "Grãos integrais são fontes ricas de fibras, ajudam na saciedade e na saúde digestiva."),
    Dica(titulo: "Modere o Consumo de Açúcar", texto: "O excesso de açúcar pode levar ao ganho de peso e ao aumento do risco de doenças crônicas."),
    Dica(titulo: "Limite o Consumo de Gorduras Trans", texto: "As gorduras trans aumentam o risco de doenças cardíacas e devem ser evitadas."),
    Dica(titulo: "Faça Refeições Regulares", texto: "Comer a cada 3-4 horas ajuda a manter os níveis de energia e evita a fome excessiva."),
    Dica(titulo: "Inclua Proteínas em Cada Refeição", texto: "Proteínas ajudam na construção muscular e proporcionam saciedade."),
    Dica(titulo: "Evite Beber Líquidos Durante as Refeições", texto: "Evitar líquidos enquanto come ajuda na digestão, pois não dilui o suco gástrico.")
]

// Tela de Introdução
struct IntroducaoView: View {
    @State private var isActive = false

    var body: some View {
        VStack {
            Spacer()

            Text("Bem-vindo ao App Viva Bem!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding()

            Text("Um app que transforma sua alimentação! Que te da a opção de organizar seu diário alimentar, fornece dicas para que você adote hábitos saudáveis de forma prática e acessível. Seu guia para comer bem, todos os dias!")
                .font(.title2)
                .padding()

            Spacer()

            // Botão para navegar para a tela das dicas
            Button(action: {
                withAnimation {
                    isActive = true
                }
            }) {
                Text("Ver Dicas")
                    .font(.headline)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(radius: 10)
            }
            .padding()

            Spacer()
        }

        .background(Color.green)
        .fullScreenCover(isPresented: $isActive) {
            // Quando o botão é pressionado, exibe a tela de Dicas
            ContentView(isBack: $isActive)
        }
    }
}

// Tela de Detalhe da Dica
struct DicaDetalheView: View {
    var dica: Dica

    var body: some View {
        VStack(alignment: .leading) {
            Text(dica.titulo)
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 10)

            Text(dica.texto)
                .font(.body)

            Spacer()
        }
        
        .padding()
        .navigationTitle("Dica")
        .transition(.slide) // Animação de transição na tela de detalhes
    }
}

// Tela com a lista de Dicas
struct ContentView: View {
    @Binding var isBack: Bool  // Recebe o binding para controlar a navegação de volta

    var body: some View {
        NavigationView {
            VStack {
                List(dicas) { dica in
                    NavigationLink(destination: DicaDetalheView(dica: dica)) {
                        Text(dica.titulo)
                            .font(.headline)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.blue.opacity(0.1)))
                            .shadow(radius: 5)
                            .transition(.scale) // Animação de transição de escala
                    }
                }
                .navigationTitle("Dicas de Alimentação Saudável")
                .padding(.top, 10)
                .background(Color.white)
                
                Spacer()

                // Botão para voltar para a tela inicial
                Button(action: {
                    withAnimation {
                        isBack = false
                    }
                }) {
                    Text("Voltar para a Tela Inicial")
                        .font(.headline)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(radius: 10)
                }
                .padding()
            }
        }
    }
}

// Pré-visualização
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        IntroducaoView()
    }
}
