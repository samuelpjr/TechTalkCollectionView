//
//  ViewController.swift
//  CollectionTest
//
//  Created by Samuel Pinheiro Junior on 23/02/2018.
//  Copyright © 2018 Samuel Pinheiro Junior. All rights reserved.
//



//1 Criar um projeto em branco
//2 Arrastar o collectionview
//3 Atribuir delegate e datasource tamanho da celula e cor.

import UIKit

class ViewController: UIViewController {

    // 17 Criar outlet da collection - @IBOutlet weak var
    @IBOutlet weak var collectionView: UICollectionView!
    
    // 4 passo o nosso Data
    var collectionData = ["1 🏆", "2 🐸", "3 🍩", "4 😸", "5 🤡", "6 👾", "7 👻", "8 👩‍🎤", "9 🎸"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 39 Instanciar o 
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(self.refresh), for: UIControlEvents.valueChanged)
//      40  O inicializador designado
//          * Isso inicializa um UIRefreshControl com uma altura e largura padrão.
//          * Uma vez atribuído a UITableViewController, o quadro do controle é gerenciado automaticamente.
//          * Quando um usuário puxou para atualizar, o UIRefreshControl dispara seu evento UIControlEventValueChanged.
        collectionView.refreshControl = refresh
        
        
        // 15 Define o tamanho das celulas e da coluna (Mostrar o slide e o stryboard)
        let width = (view.frame.size.width - 30) / 3
        // 16 manipular a collection view -> Criar outlet da collection
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        //layout.scrollDirection = UICollectionViewScrollDirection(rawValue: 1)!
        let height = width * 1.47
        // 17 acessar o itemsize através da classe flowLayout ( Habilitar section no storyboard)
        layout.itemSize = CGSize(width: width, height: height)
        
    }
    
    // 32 Primeiro criar um metodo que vai adicionar ao final do array um novo item
    func addItem(){
        // 33 Pegar o ultimo numero do array
        let text = "\(collectionData.count + 1) 😸"
        // 34 Adicionar no array
        collectionData.append(text)
        // 35 Dar aquele reload data na collection pra aaprecer certo ? Mas anter criar o metodo de refresh
        //collectionView.reloadData()
        
        let index = IndexPath(row: collectionData.count - 1, section: 0)
        collectionView.insertItems(at: [index])
    }
    
    // 36 Criar o metodo da refresh... Como o #selector é Objc precisamos do @objc
    @objc func refresh(){
        //37 Chamar o metodo addItem
        addItem()
        //38 endRefreshing: Deve ser explicitamente chamado quando a atualização foi completada - Inserir o trigger no viewDidiload
        collectionView.refreshControl?.endRefreshing()
    }
}

// 5 criar extention para separar as camadas da collection
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    // 6 numero de seções mostrar no slide
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    /// 7 numero de celulas mostrar q cresce para o lado até querbrar a linha
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionData.count
    }
    /// 8 Criar só a casca para falar do reusable
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        /// 9 Criar só a casca para falar do reusable e parar para falr da celulca customizada (Criar new file CustonCollection)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! CustonCollectionViewCell
        // 13 minha celula tem uma label que vou inserir meu texto. Que será o indice da linha da minha collection.
        cell.textLabel.text = collectionData[indexPath.row]
        
        // 14 Como o metodo espera um retorno de uma UICollectionViewCell retornamos ele no final (Ir pro grid viewDidLoad)
        return cell
    }
    
    // 18 Habilitar section no SB
    // 19 criar o methodo collectionView.viewForSupplementaryElementOfKind
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        // 20 Comentar sobre a reutilização e inserir o id no S. Board
        if let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeader", for: indexPath) as? CustomCollectionReusableView {
            // 21 Mas antes criaremos a celula customisada para a section como foi na celula, inserindo no SB e criando os Outlets (Criar new file)
            sectionHeader.headerTitleLabel.text = "Emoji title section"
            return sectionHeader
        }
        return UICollectionReusableView()
    }

    

}

