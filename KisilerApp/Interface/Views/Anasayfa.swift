//
//  ViewController.swift
//  KisilerApp
//
//  Created by Omer Keskin on 5.05.2024.
//

import UIKit

class Anasayfa: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var kisilerListesi = [Kisiler]()
    var anasayfaVM = AnasayfaViewModel()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
        
        _ = anasayfaVM.kisilerListesi.subscribe(onNext: { liste in
            self.kisilerListesi = liste
            self.tableView.reloadData()
            
        })
        
        let k1 = Kisiler(kisi_id: 1, kisi_ad: "ali", kisi_tel: "1234")
        let k2 = Kisiler(kisi_id: 2, kisi_ad: "veli", kisi_tel: "1235")
        let k3 = Kisiler(kisi_id: 3, kisi_ad: "ahmet", kisi_tel: "1236")
        
        kisilerListesi.append(k1)
        kisilerListesi.append(k2)
        kisilerListesi.append(k3)
        
    }

    override func viewWillAppear(_ animated: Bool) {
        anasayfaVM.kisiUpload()
    }
    
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetayVC"{
            if let kisi = sender as? Kisiler{
                let destination = segue.destination as! KisiDetay
                destination.kisi = kisi
            }

        }
    }
    

}


extension Anasayfa: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        anasayfaVM.ara(aramaKelimesi: searchText)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kisilerListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "kisilerHucre") as! KisilerHucreTableViewCell
        let kisi = kisilerListesi[indexPath.row]
        cell.labelKisiAd.text = kisi.kisi_ad
        cell.labelKisiTel.text = kisi.kisi_tel
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let kisi = kisilerListesi[indexPath.row]
        performSegue(withIdentifier: "toDetayVC", sender: kisi)
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { contextualAction, view, bool in
            let kisi = self.kisilerListesi[indexPath.row]
            
            let alert = UIAlertController(title: "Delete", message: "Do you want to delete the \(kisi.kisi_ad!)?", preferredStyle: .alert)
            
            let iptalAction = UIAlertAction(title: "Cancel", style: .cancel)
            alert.addAction(iptalAction)
            
            let evetAction = UIAlertAction(title: "Delete", style: .destructive){_ in
                self.anasayfaVM.sil(kisi_id: kisi.kisi_id!)}
            alert.addAction(evetAction)
            
            self.present(alert, animated: true)
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}
