//
//  EstacionamentoViewModel.swift
//  Estacionamento
//
//  Created by Ruan Medeiros on 11/04/24.
//

import Foundation

class EstacionamentoViewModel: ObservableObject {
    @Published var estacionamentos : [Estacionamento] = []
    
    func fetch() {
        guard let url = URL(string: "http://127.0.0.1:1880/estacionamento")
        else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){[weak self] data, _, error in
            guard let data = data, error == nil else{
                return
            }
            do {
                let parsed = try JSONDecoder().decode([Estacionamento].self, from: data)
                
                DispatchQueue.main.async{
                    self?.estacionamentos = parsed
                }
            }catch{
                print(error)
            }
        }
        task.resume()
    }
    
    func post(body: Estacionamento){
        let jsonData = try? JSONEncoder().encode(body)
        
        // create post request
        let url = URL(string: "http://127.0.0.1:1880/estacionamento")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        // insert json data to the request
        request.httpBody = jsonData

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                print(responseJSON)
            }
        }

        task.resume()
    }
    
    func put(body: Estacionamento){
        let jsonData = try? JSONEncoder().encode(body)
        
        // create post request
        let url = URL(string: "http://127.0.0.1:1880/estacionamento")!
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"

        // insert json data to the request
        request.httpBody = jsonData

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                print(responseJSON)
            }
        }

        task.resume()
    }
    
}
