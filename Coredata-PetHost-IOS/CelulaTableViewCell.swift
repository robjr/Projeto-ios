//
//  CelulaTableViewCell.swift
//  Coredata-PetHost-IOS
//
//  Created by admin on 01/09/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit

class CelulaTableViewCell: UITableViewCell {

    @IBOutlet weak var nomeAnfitriao: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        if(selected == true){
            
            print(nomeAnfitriao.text)
            
            let alerta = UIAlertController(title: "Atencao", message: "Treta", preferredStyle: UIAlertControllerStyle.Alert)
            alerta.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.window?.rootViewController?.presentViewController(alerta, animated:true, completion: nil)
            
        }
    }

}
