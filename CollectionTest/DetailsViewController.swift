//
//  DetailsViewController.swift
//  CollectionTest
//
//  Created by Samuel Pinheiro Junior on 01/03/2018.
//  Copyright © 2018 Samuel Pinheiro Junior. All rights reserved.
//

import UIKit


class DetailsViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    /// 27 Criar só a casca para falar do reusable
    var collectionData = ["1 🏆", "2 🐸", "3 🍩", "4 😸", "5 🤡", "6 👾", "7 👻", "8 👩‍🎤", "9 🎸"]//, "10 🍖", "11 🐯", "12 🌋"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 31 Criar horizontal layout programaticamente (Plus add when refresh...ViewController)
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = UICollectionViewScrollDirection.horizontal
    }
}

// 25 Novamente Criar extention
extension DetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    /// 26 numero de celulas mostrar q cresce para o lado até querbrar a linha.. só que aqui ele não vai quebrar....
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionData.count
    }
    /// 28 Criar só a casca para falar do reusable
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        /// 29 Criar só a casca para falar do reusable e parar para falr da celulca customizada (Criar new file CustonCollection)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! CustonCollectionViewCell
         // 30 minha celula tem uma label que vou inserir meu texto. Que será o indice da linha da minha collection.
        cell.textLabelDetails.text = collectionData[indexPath.row]
        
        return cell
        
    }
}
