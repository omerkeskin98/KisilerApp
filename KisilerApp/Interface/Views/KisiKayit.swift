//
//  KisiKayit.swift
//  KisilerApp
//
//  Created by Omer Keskin on 5.05.2024.
//

import UIKit

class KisiKayit: UIViewController {

    @IBOutlet weak var kisiAdiTextField: UITextField!
    @IBOutlet weak var kisiTelTextField: UITextField!
    
    var kisiKayitVM = KisiKayıtViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func kaydetClicked(_ sender: Any) {
        
        if let ad = kisiAdiTextField.text, let tel = kisiTelTextField.text{
            kisiKayitVM.kaydet(kisi_ad: ad, kisi_tel: tel)
            
        }
    }
    
}


