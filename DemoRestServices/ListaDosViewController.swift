//
//  ListaDosViewController.swift
//  DemoRestServices
//
//  Created by Giovanni on 11/24/17.
//  Copyright © 2017 Francisco Sanchez. All rights reserved.
//

import UIKit

class ListaDosViewController: UIViewController {

    @IBOutlet weak var coleccion: UICollectionView!
    var listData:   NSMutableArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url: String = "http://www.andina.com.pe/WSAndina/AndinaService.svc/GetNoticiasSeccion"
        
        var body = Dictionary<String, AnyObject>()
        body["seccionid"] = 17 as AnyObject

        
        if(NetworkManager.isConnectedToNetwork()){
            NetworkManager.sharedInstance.callUrlWithCompletion(url: url, params: body, completion: {
                (finished, response) in
                if(finished){
                    let json = response["GetNoticiasSeccionResult"] as! Dictionary<String, AnyObject>
                    let array = NSMutableArray(array: json["Result"] as! NSArray)
                    self.listData = array
                    self.coleccion.reloadData()
                }else{
                    // Error de conexion
                }
            }, method: .post)
        }else{
            // indica que no hay internet
        
        }
        
        
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

extension ListaDosViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    //
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listData.count
    }
    
    //
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celda = collectionView.dequeueReusableCell(withReuseIdentifier: "CeldaListaDosCollectionViewCell", for: indexPath) as! CeldaListaDosCollectionViewCell
        
        celda.itemLista = self.listData[indexPath.row] as! Dictionary<String, AnyObject>
        celda.iniciarCelda()
        return celda
    }
    
    //
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let w = (collectionView.frame.width - 30) / 2
        let h = w * 1.5
        return CGSize(width: w, height: h)
    }
    
    //
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let itemData = self.listData[indexPath.row] as! Dictionary<String, AnyObject>
        DetalleListaDosViewController.itemLista = itemData
        
        let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DetalleListaDosViewController") as! DetalleListaDosViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
