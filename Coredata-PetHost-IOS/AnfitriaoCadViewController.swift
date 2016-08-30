//
//  AnfitriaoCadTableViewController.swift
//  Coredata-PetHost-IOS
//
//  Created by admin on 28/08/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit
import CoreData

class AnfitriaoCadViewController: UIViewController
{

    @IBOutlet weak var nometf: UITextField!
    @IBOutlet weak var endtf: UITextField!
    @IBOutlet weak var teletf: UITextField!
    @IBOutlet weak var emailtf: UITextField!
    @IBOutlet weak var senhatf: UITextField!
    @IBOutlet weak var confsenhatf: UITextField!
    
    var anfitriao = [NSManagedObject]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func SaveAnfitriao(sender: AnyObject) {
        let name = self.nometf.text
        let endereco = self.endtf.text
        let telefone = self.teletf.text
        let email = self.emailtf.text
        let senha = self.senhatf.text
        //let confsenha = self.confsenhatf.text
        
        print("Entrou no metodo SaveAnfitriao")
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        let entity = NSEntityDescription.entityForName("ContaAnfitriao", inManagedObjectContext: managedContext)
        
        let contanfit = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        contanfit.setValue(name, forKey: "nome")
        contanfit.setValue(endereco, forKey: "endereco")
        contanfit.setValue(telefone, forKey: "telefone")
        contanfit.setValue(email, forKey: "email")
        contanfit.setValue(senha, forKey: "senha")
        
        let fetchRequest = NSFetchRequest(entityName: "ContaAnfitriao")
        
        do {
            try managedContext.save()
            
            anfitriao.append(contanfit)
            let results = try managedContext.executeFetchRequest(fetchRequest)
            anfitriao = results as! [NSManagedObject]
            print(results)
            
        }catch let error as NSError {
            print("Could not save\(error), \(error.userInfo)")
        }
    }
    
}
