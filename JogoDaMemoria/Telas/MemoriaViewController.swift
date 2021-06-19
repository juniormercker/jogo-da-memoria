//
//  ViewController.swift
//  JogoDaMemoria
//
//  Created by Júnior on 18/06/21.
//

import UIKit

class MemoriaViewController: UIViewController {

    @IBOutlet var cardBotoes: [UIButton]!
    
    var jogoDaMemoria: JogoDaMemoria = JogoDaMemoria.aleatorio()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func toqueBotaoResetar(_ sender: Any) {
        novoJogo()
    }

    func atualizarTela() {
        if jogoDaMemoria.deveLimparSelecao {
            let indexDoPrimeiroCard = jogoDaMemoria.indexPrimeiroCard
            let indexDoSegundoCard = jogoDaMemoria.indexSegundoCard
           
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                let imagemDefault = UIImage(named: "card")
                
                self.cardBotoes[indexDoPrimeiroCard].setImage(imagemDefault, for: .normal)
                self.cardBotoes[indexDoSegundoCard].setImage(imagemDefault, for: .normal)
            }
        }
    }
    
    func novoJogo() {
        let imagem = UIImage(named: "card")
        for card in cardBotoes {
            card.setImage(imagem, for: .normal)
        }
        
        jogoDaMemoria = JogoDaMemoria.aleatorio()
    }

    @IBAction func toqueCardBotao(_ sender: UIButton) {
        if let index = cardBotoes.firstIndex(of: sender) {
            jogoDaMemoria.tentativa(no: index)
            let imagemString = jogoDaMemoria.pegarImagem(do: index)
            
            if let imagem = UIImage(named: imagemString) {
                sender.setImage(imagem, for: .normal)
            }
            
            atualizarTela()
        }
    }
    
}

