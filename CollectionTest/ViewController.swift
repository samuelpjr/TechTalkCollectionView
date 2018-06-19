//
//  ViewController.swift
//  CollectionTest
//
//  Created by Samuel Pinheiro Junior on 23/02/2018.
//  Copyright © 2018 Samuel Pinheiro Junior. All rights reserved.
//





import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var collectionData = ["1 🏆", "2 🐸", "3 🍩", "4 😸", "5 🤡", "6 👾", "7 👻", "8 👩‍🎤", "9 🎸"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(self.refresh), for: UIControlEvents.valueChanged)

        collectionView.refreshControl = refresh
        
        
        let width = (view.frame.size.width - 30) / 3
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        let height = width * 1.47
        
        layout.itemSize = CGSize(width: width, height: height)
        
    }
    
    
    func addItem(){
        
        let text = "\(collectionData.count + 1) 😸"
        
        collectionData.append(text)
        
        
        let index = IndexPath(row: collectionData.count - 1, section: 0)
        collectionView.insertItems(at: [index])
    }
    
    
    @objc func refresh(){
        
        addItem()
        
        collectionView.refreshControl?.endRefreshing()
    }
}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
    
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! CustonCollectionViewCell
    
        cell.textLabel.text = collectionData[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
     
        if let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeader", for: indexPath) as? CustomCollectionReusableView {
     
            sectionHeader.headerTitleLabel.text = "Emoji title section"
            return sectionHeader
        }
        return UICollectionReusableView()
    }

    

}

