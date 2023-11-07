import SwiftUI
import Combine
import PlaygroundSupport //solo para que fiuncione SwiftUI.


// -------------- Modelos ------------------

struct Person: Codable {
    let id: UUID
    let name: String
    let apells: String
    let nif: String
}

enum Estados {
    case none, loading, loaded, error
}



// ------------ ViewModel -----------------------


final class ViewModelPerson: ObservableObject{
   
    @Published var data: Person?  //modelo de la persona
    @Published var estado: Estados = .none //Estado de la llamada de red (simulada)
    
    init(){
        loadPerson() //llamar a la funcion.
    }
    
    //carga el empleado simulando llamada de red
    func loadPerson(){
        estado = .loading //cambia el estado
        
        //simulamos una llamada de red, que esperamos 2 segundos.
        DispatchQueue.main.asyncAfter(deadline: .now()+2.0){
            self.data = Person(id: UUID(), name: "Manuel", apells: "Bustos Llanos", nif: "12345678H")
            self.estado = .loaded
        }
    }
}


// ------------ View SwiftUI -----------------------

struct ContentView : View{
    
   @StateObject private var viewModel = ViewModelPerson()
    
    var body: some View{
        
        switch viewModel.estado{
        case .none:
                Text("Estado none")
        case .loading:
                Text("Cargando datos...")
        case .error:
                Text("Se ha producido un error")
        case .loaded:
            VStack{
                if let data = viewModel.data {
                    //Imagen del empleado
                    Image(systemName: "person")
                        .resizable()
                        .frame(width: 100, height: 100)
                    
                    // Nombre
                   // let fullname = data.name + " " + data.apells
                   // Text(fullname)
                    Text("\(data.name) \(data.apells)")
                    
                } else {
                    Text("No hay datos")
                }
            }
            .padding()
            .onReceive(self.viewModel.$data, perform: { _ in
                //se ejecuta antes de repintar la UI
                print("Cambia el dato....\(self.viewModel.data?.name)")
            })
            .onReceive(self.viewModel.$estado, perform: { _ in
                //se ejecuta antes de repintar la UI
                print("Cambia el estado")
            })
        }
    }
}


//ejecuta la salida de la view en el payground
PlaygroundPage.current.setLiveView(ContentView().frame(width: 200, height: 200))

