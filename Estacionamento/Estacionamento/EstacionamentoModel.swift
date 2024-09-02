//
//  EstacionamentoModel.swift
//  Estacionamento
//
//  Created by Ruan Medeiros on 11/04/24.
//

import Foundation

struct Carro: Codable, Identifiable {
    let id: String?
    let cor: String?
    let ano: Int?
    let modelo: String?
    let preco: Double?
    let foto: String?
}

struct Estacionamento: Codable, Identifiable {
    let id: String?
    let _id: String?
    let _rev: String?
    var nomeEstacionamento: String?
    var quantidadeCarrosMax: Int?
    var carros: [Carro]?
}
