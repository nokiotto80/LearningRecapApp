//  CollectionViewController.swift
//  LearningRecapApp
//
//  Created by Vincenzo Pugliese on 12/01/2018.
//  Copyright © 2018 Vincenzo Pugliese. All rights reserved.

import UIKit

private let reuseIdentifier = "Cell"

var vettoreImmagini: [UIImage] = [#imageLiteral(resourceName: "HiedaAdriana"),#imageLiteral(resourceName: "topo1"),#imageLiteral(resourceName: "speedTestNet_EthernetWithAdapter13nov"),#imageLiteral(resourceName: "images"),#imageLiteral(resourceName: "Pasquale_Pelliccia_Game code 3nov"),#imageLiteral(resourceName: "me24novACADEMY"),#imageLiteral(resourceName: "collaboration"),#imageLiteral(resourceName: "ArrowLeft"),#imageLiteral(resourceName: "Master_Class_group_photo15nov2017_lab4"),#imageLiteral(resourceName: "handoff_sync_ipad")]

class CollectionViewController: UICollectionViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet var myCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

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
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return vettoreImmagini.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        // Configure the cell
        cell.lblCell.text = "cella "
        cell.imageViewCell.image = vettoreImmagini[indexPath.row]
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! CollectionViewCell
        if segue.identifier == "Cell_Image" {
            let destination = segue.destination as! Cell_Image
             print(cell.imageViewCell.image!)
          
            destination.immagine = cell.imageViewCell.image


        }
    }
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */
    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */
    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
}
