//
//  KisiDetay.swift
//  KisilerApp
//
//  Created by Omer Keskin on 5.05.2024.
//

import UIKit

class KisiDetay: UIViewController {
    
    var kisi : Kisiler?
    
    @IBOutlet weak var adTextField: UITextField!
    @IBOutlet weak var telTextField: UITextField!
    
    var kisiDetayVM = KisiDetayViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

  
        if let k = kisi{
            adTextField.text = k.kisi_ad
            telTextField.text = k.kisi_tel
        }
    }
    

    @IBAction func guncelleClicked(_ sender: Any) {
        
        if let k = kisi, let ad = adTextField.text, let tel = telTextField.text{
            kisiDetayVM.guncelle(kisi_id: k.kisi_id!, kisi_ad: ad, kisi_tel: tel)
        }
    }
    
    

    
}
