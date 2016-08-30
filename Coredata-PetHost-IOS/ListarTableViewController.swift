//
//  ListarTableViewController.swift
//  Coredata-PetHost-IOS
//
//  Created by admin on 30/08/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit
import CoreData
class ListarTableViewController: UITableViewController {

    var anfitriao = [NSManagedObject]()
    var names = [String]()
    
    @IBOutlet weak var lbNome: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "hehe"
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "celula")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return anfitriao.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("celula")
        let nome = anfitriao[indexPath.row]
        cell!.textLabel!.text = nome.valueForKey("nome") as? String
        return cell!
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "ContaAnfitriao")
        
        print("Entrou no view will")
        do {
            print("Entrou no view will1")
            let results = try managedContext.executeFetchRequest(fetchRequest)
            print("Entrou no view will2")
            anfitriao = results as! [NSManagedObject]
            print("Entrou no view will3")
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
