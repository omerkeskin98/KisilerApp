//
//  KisiKayıtViewModel.swift
//  KisilerApp
//
//  Created by Omer Keskin on 14.05.2024.
//

import Foundation


class KisiKayıtViewModel{
    
    var kRepo = Repository()
    
    func kaydet(kisi_ad: String, kisi_tel: String){
        kRepo.kaydet(kisi_ad: kisi_ad, kisi_tel: kisi_tel)
        
    }
}
