import SwiftUI

struct FAQ: Identifiable {
    let id = UUID()
    let question: String
    let answer: String
}

struct FAQView: View {
    @State private var faqs: [FAQ] = [
        FAQ(question: "¿Cómo busco un lugar específico?", answer: "En la barra de búsqueda, escribe el nombre del lugar o una palabra clave relacionada y presiona enter. La aplicación buscará en la base de datos y te mostrará los lugares que corresponden a tu búsqueda."),
        FAQ(question: "¿Cómo cambio la vista del mapa a una lista?", answer: "En la esquina superior derecha de la pantalla, hay un selector de vista. Toca 'Lista' para cambiar a la vista de lista."),
        FAQ(question: "¿Cómo centro mi ubicación actual?", answer: "En el centro del mapa de la pantalla hay un botón de ubicación. Toca el botón para centrar el mapa en tu ubicación actual.")
    ]


    var body: some View {
        List {
            ForEach(faqs) { faq in
                Section(header: Text(faq.question)
                            .font(.headline)
                            .foregroundColor(.blue)
                ) {
                    Text(faq.answer)
                }
            }
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle("Preguntas frecuentes", displayMode: .inline)
    }
}

struct FAQView_Previews: PreviewProvider {
    static var previews: some View {
        FAQView()
    }
}
