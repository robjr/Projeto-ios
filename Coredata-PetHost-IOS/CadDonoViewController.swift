//
//  CadDonoViewController.swift
//  Coredata-PetHost-IOS
//
//  Created by admin on 31/08/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit
import CoreData

class CadDonoViewController: UIViewController {

    @IBOutlet weak var lbNome: UITextField!
    @IBOutlet weak var lbEmail: UITextField!
    @IBOutlet weak var lbSenha: UITextField!
    @IBOutlet weak var lbConfSenha: UITextField!
    
    var dono = [NSManagedObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SaveDono(sender: AnyObject) {
        let name = self.lbNome.text
        let email = self.lbEmail.text
        let senha = self.lbSenha.text
        //let confsenha = self.lbConfSenha.text
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        let entity = NSEntityDescription.entityForName("ContaDono", inManagedObjectContext: managedContext)
        
        let contadono = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        contadono.setValue(name, forKey: "nome")
        contadono.setValue(email, forKey: "email")
        contadono.setValue(senha, forKey: "senha")
        
        let fetchRequest = NSFetchRequest(entityName: "ContaDono")
        
        do {
            try managedContext.save()
            
            dono.append(contadono)
            let results = try managedContext.executeFetchRequest(fetchRequest)
            dono = results as! [NSManagedObject]
            print(results)
            
        }catch let error as NSError {
            print("Could not save\(error), \(error.userInfo)")
        }
        
        let TelaDono  = self.storyboard!.instantiateViewControllerWithIdentifier("BVdono") as! DonoViewController
        self.navigationController?.pushViewController(TelaDono, animated: true)
    }

}
