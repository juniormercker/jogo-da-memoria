//
//  Card.swift
//  JogoDaMemoria
//
//  Created by Júnior on 18/06/21.
//

import Foundation

class Card {
    let imagem: String
    var selecionado: Bool = false
    var acertado: Bool = false
    
    init (imagem: String) {
        self.imagem = imagem
    }
    
    func alterarSelecionar(valor: Bool) {
        selecionado = valor
    }
    
    func acertar() {
        acertado = true
    }

    func foiSelecionado() -> Bool {
        return selecionado
    }
    
    func foiAcertado() -> Bool {
        return acertado
    }
}
