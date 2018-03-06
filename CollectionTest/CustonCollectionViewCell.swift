//
//  CustonCollectionViewCell.swift
//  CollectionTest
//
//  Created by Samuel Pinheiro Junior on 25/02/2018.
//  Copyright © 2018 Samuel Pinheiro Junior. All rights reserved.
//

import UIKit

// 10 herdar de UICollectionViewCell
// 11 inserir a classe no storyboard
// 12 criar conexão com text label  ( @IBOutlet weak var varName: UILabel!) Voltar ViewController...
class CustonCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var textLabelDetails: UILabel!
}
