//
//  AnasayfaViewModel.swift
//  KisilerApp
//
//  Created by Omer Keskin on 14.05.2024.
//

import Foundation
import RxSwift

class AnasayfaViewModel{
    
    var kisilerListesi = BehaviorSubject<[Kisiler]>(value: [Kisiler]())
    var kRepo = Repository()
    
    
    init(){
        veritabaniKopyala()
        kisilerListesi = kRepo.kisilerListesi
    }
    
    func ara(aramaKelimesi: String){
        kRepo.ara(aramaKelimesi: aramaKelimesi)
        
    }
    
    
    func sil(kisi_id: Int){
        kRepo.sil(kisi_id: kisi_id)
        kisiUpload()
    }
    
    func kisiUpload(){
        kRepo.kisiUpload()
    }
    
    
    func veritabaniKopyala(){
            let bundleYolu = Bundle.main.path(forResource: "rehber", ofType: ".sqlite")
            let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("rehber.sqlite")
            let fileManager = FileManager.default
            if fileManager.fileExists(atPath: kopyalanacakYer.path){
                print("Veritabanı zaten var")
            }else{
                do{
                    try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
                }catch{}
            }
    }

    
}
