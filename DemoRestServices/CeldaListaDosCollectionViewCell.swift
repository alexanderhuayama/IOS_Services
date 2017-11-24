//
//  CeldaListaDosCollectionViewCell.swift
//  DemoRestServices
//
//  Created by Giovanni on 11/24/17.
//  Copyright © 2017 Francisco Sanchez. All rights reserved.
//

import UIKit

class CeldaListaDosCollectionViewCell: UICollectionViewCell {
    // Item traido de la lista
    var itemLista: Dictionary<String, AnyObject>!
    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var imgFoto: UIImageView!
    
    func iniciarCelda(){
        let url = self.itemLista["URLFoto"] as! String
        let nombre = self.itemLista["DescripcionFecha"] as! String
        self.imgFoto.sd_setImage(with: URL(string: url))
        self.lblNombre.text = nombre
    }
}
