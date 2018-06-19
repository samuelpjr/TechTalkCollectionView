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
    
   
    var collectionData = ["1 🏆", "2 🐸", "3 🍩", "4 😸", "5 🤡", "6 👾", "7 👻", "8 👩‍🎤", "9 🎸"]//, "10 🍖", "11 🐯", "12 🌋"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
   
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = UICollectionViewScrollDirection.horizontal
    }
}


extension DetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! CustonCollectionViewCell

        cell.textLabelDetails.text = collectionData[indexPath.row]
        
        return cell
        
    }
}
