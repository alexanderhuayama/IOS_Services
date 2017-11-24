//
//  DetalleListaDosViewController.swift
//  DemoRestServices
//
//  Created by Giovanni on 11/24/17.
//  Copyright © 2017 Francisco Sanchez. All rights reserved.
//

import UIKit

class DetalleListaDosViewController: UIViewController {

    static var itemLista: Dictionary<String, AnyObject>!
    
    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var imgFoto: UIImageView!
    @IBOutlet weak var lblIdNoticia: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url : String = DetalleListaDosViewController.itemLista["URLFoto"] as! String
        let nombre : String =  DetalleListaDosViewController.itemLista["DescripcionFecha"] as! String
        let idNoticia : Int32 = DetalleListaDosViewController.itemLista["NoticiaId"] as! Int32
        
        self.lblNombre.text = nombre
        self.imgFoto.sd_setImage(with: URL(string: url))
        self.lblIdNoticia.text = String(idNoticia)

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
