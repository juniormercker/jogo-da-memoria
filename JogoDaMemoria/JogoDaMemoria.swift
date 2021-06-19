//
//  JogoDaMemoria.swift
//  JogoDaMemoria
//
//  Created by Júnior on 18/06/21.
//

import Foundation

class JogoDaMemoria {
    
    var cards: [Card]
    
    init(cards: [Card]) {
        self.cards = cards
    }
    
    private(set) var primeiroCardSelecionado: Card = Card(imagem: "")
    var indexPrimeiroCard: Int = -1
    var indexSegundoCard: Int = -1
    var deveLimparSelecao: Bool = false
    
    func tentativa(no index:Int) {
        deveLimparSelecao = false
        let card = cards[index]

        guard primeiroCardSelecionado.foiSelecionado() else {
            primeiroCardSelecionado = card
            primeiroCardSelecionado.alterarSelecionar(valor: true)
            indexPrimeiroCard = index
            return
        }
        
        primeiroCardSelecionado.alterarSelecionar(valor: false)
        if primeiroCardSelecionado.imagem == card.imagem {
            indexPrimeiroCard = -1
            indexSegundoCard = -1
        } else {
            indexSegundoCard = index
            deveLimparSelecao = true
        }
        primeiroCardSelecionado = Card(imagem: "")
    }
    
    func pegarImagem(do index:Int) -> String {
        return cards[index].imagem
    }
}

extension JogoDaMemoria {
    
    class func aleatorio() -> JogoDaMemoria {
        let cardsMisturados: [String] = cardsDisponiveis.shuffled()
        let cardsMapeados: [Card] = cardsMisturados.map ({ Card(imagem: $0)})
        
        return JogoDaMemoria(cards: cardsMapeados)
    }
}

private let cardsDisponiveis = [
    "cardCavaleiro",
    "cardCavaleiro",
    "cardAnao",
    "cardAnao",
    "cardBruxa",
    "cardBruxa",
    "cardElfa",
    "cardElfa",
    "cardMago",
    "cardMago",
]
