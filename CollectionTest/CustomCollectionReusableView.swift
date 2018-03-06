//
//  CustomCollectionReusableView.swift
//  CollectionTest
//
//  Created by Samuel Pinheiro Junior on 25/02/2018.
//  Copyright © 2018 Samuel Pinheiro Junior. All rights reserved.
//

import UIKit

// 22 herdar de UICollectionViewCell
// 23 inserir a classe no storyboard
// 24 criar conexão com text label  ( @IBOutlet weak var varname: UILabel!)
class CustomCollectionReusableView: UICollectionReusableView {
        @IBOutlet weak var headerTitleLabel: UILabel!
}
