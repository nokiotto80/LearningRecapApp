//
//  TableViewController.swift
//  LearningRecapApp
//
//  Created by Vincenzo Pugliese on 12/01/2018.
//  Copyright © 2018 Vincenzo Pugliese. All rights reserved.

import UIKit

class TableViewController: UITableViewController {

    
    var studentMasterClass: [String] = ["VINCENZO PUGLIESE",  //Array of strings
                                        "GIANLUIGI MARRA",   //IT'S EASIER than dictionary
                                        "STEFANO POMA",
                                        "LUCA TARASCO",
                                        "MADDALENA GRANATA",
                                        "FRANCESCO DE_LUCA",
                                        "GISELLE KATICS",
                                        "LIVIO LANGELLA",
                                        "MARCO ROMANO",
                                        "CLEMENTE GUERRA",
                                        "EDSON TICONA_ZEGARRA",
                                        "DMITRY MAZUR",
                                        "CARLOS PIRES",
                                        "RANY AZEVEDO",
                                        "GEOMAR BASTIANI",
                                        "BALDEV GHELANI",
                                        "FRANCESCO TRUSIANO",
                                        "EMILIANO ROMEO",
                                        "ADRIANO SALES",
                                        "HIEDA ADRIANA",
                                        "MARCELO SOTOMAYOR",
                                        "GIOVANNI MONACO"]
  
    @IBOutlet weak var imageViewTable: UIImageView!
    @IBOutlet var myTableView: UITableView!
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return studentMasterClass.count
    }
 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "collegue", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = "🎓 "+studentMasterClass[indexPath.row]

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! TableViewCell
        if segue.identifier == "Table_Image" {
            let destination = segue.destination as! Table_Image
//            print(cell.imageViewCell.image!)
            
            destination.nomeCognome = cell.lblNomeCognome.text!
    
        }
    }
   
   
   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "Table_Image", sender: tableView.cellForRow(at: indexPath))
    }

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let cell = sender as! UITableViewCell
//        if segue.identifier == "Table_Image" {
//                      destination.lblNome = String(myTableView.cellForRow(at: <#T##IndexPath#>))
////            //                 destination.imageViewCell.image = #imageLiteral(resourceName: "collaboration")
//        }
//    }
    
    
 /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
