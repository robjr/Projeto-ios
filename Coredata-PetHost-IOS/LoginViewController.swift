//
//  LoginViewController.swift
//  Coredata-PetHost-IOS
//
//  Created by admin on 01/09/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit
import CoreData

class LoginViewController: UIViewController {

    @IBOutlet weak var lbEmail: UITextField!
    @IBOutlet weak var lbSenha: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func CheckForUserNameAndPasswordMatch(sender: AnyObject) {
        
        let lbemail : String!
        lbemail = self.lbEmail.text
        let lbsenha : String!
        lbsenha = self.lbSenha.text
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        // Initialize Fetch Request
        let fetchRequestDono = NSFetchRequest()
        let fetchRequestAnfitriao = NSFetchRequest()
        
        // Create Entity Description
        let entityDescriptionDono = NSEntityDescription.entityForName("ContaDono", inManagedObjectContext: managedContext)
        let entityDescriptionAnfitriao = NSEntityDescription.entityForName("ContaAnfitriao", inManagedObjectContext: managedContext)
        
        // Configure Fetch Request
        fetchRequestDono.entity = entityDescriptionDono
        fetchRequestAnfitriao.entity = entityDescriptionAnfitriao
        
        print("Teste um")
        
        do {
            let resultDono = try managedContext.executeFetchRequest(fetchRequestDono)
            if (resultDono.count > 0) {

                for numero in 1...resultDono.count{
                    let emaildono = resultDono[numero-1].valueForKey("email") as! String
                    let senhadono = resultDono[numero-1].valueForKey("senha") as! String
                    if (emaildono == lbemail && senhadono == lbsenha){
                        let TelaDono  = self.storyboard!.instantiateViewControllerWithIdentifier("BVdono") as! DonoViewController
                        self.navigationController?.pushViewController(TelaDono, animated: true)
                        break
                    }
                }
                
                let resultAnfitriao = try managedContext.executeFetchRequest(fetchRequestAnfitriao)
                for numero in 1...resultAnfitriao.count{
                    let emailanfit = resultAnfitriao[numero-1].valueForKey("email") as! String
                    let senhaanfit = resultAnfitriao[numero-1].valueForKey("senha") as! String
                    if (emailanfit == lbemail && senhaanfit == lbsenha){
                        print("cade")
                        let TelaAnfitriao  = self.storyboard!.instantiateViewControllerWithIdentifier("BVanfitriao") as! AnfitriaoController
                        self.navigationController?.pushViewController(TelaAnfitriao, animated: true)
                        break
                    }
                }
            }
            
        } catch {
            let fetchError = error as NSError
            print(fetchError)
        }
    }
    
}
