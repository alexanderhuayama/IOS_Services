//
//  SongsViewController.swift
//  DemoRestServices
//
//  Created by Docente801 on 1/06/17.
//  Copyright © 2017 Francisco Sanchez. All rights reserved.
//

import UIKit

class SongsViewController: UIViewController {
    
    @IBOutlet weak var songsCollection: UICollectionView!
    
    var songsData: NSMutableArray = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        var param = Dictionary<String, AnyObject>()
//        
//        param ["llave"] = "" as AnyObject
//        param ["llave"] = "" as AnyObject
//        param ["llave"] = "" as AnyObject
        
        
        let url: String = "https://itunes.apple.com/search?term=tongo&country=pe"
        
        if(NetworkManager.isConnectedToNetwork()){
        
            NetworkManager.sharedInstance.callUrlWithCompletion(url: url, params: nil, completion: { (finished, response) in
                
                if(finished){
                    
                    let result = NSMutableArray(array: response["results"] as! NSArray)
                    
                    self.songsData = result
                    
                    self.songsCollection.reloadData()
                    
                }else{
                    /// error de conexion
                }
            }, method: .get)
        }else{
            // debo indicar que no hay internet
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension SongsViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.songsData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SongCell", for: indexPath) as! SongCell
        
        cell.songData = self.songsData[indexPath.row] as! Dictionary<String,AnyObject>
        
        cell.initCell()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let w = (collectionView.frame.width - 30) / 2
        
        let h = w * 1.5
        
        return CGSize(width: w, height: h)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let songData = self.songsData[indexPath.row] as! Dictionary<String,AnyObject>
        
        DetailViewController.songData = songData
        
        let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
}
