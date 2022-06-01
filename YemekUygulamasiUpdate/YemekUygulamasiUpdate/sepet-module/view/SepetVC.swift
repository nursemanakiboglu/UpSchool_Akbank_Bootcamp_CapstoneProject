//
//  SepetVC.swift
//  YemekUygulamasiUpdate
//
//  Created by Nursema Nakiboğlu on 31.05.2022.
//

import UIKit

//CacoaTouchClass //UIViewController

class SepetVC: UIViewController
{

    @IBOutlet weak var sepetTableView: UITableView!
    
    var sepetYemekListe = [SepetSinif]()
    
    var sepetPresenterNesnesi:ViewToPresenterSepetProtocol?

    override func viewDidLoad()
    {
        super.viewDidLoad()
        sepetTableView.delegate = self
        sepetTableView.dataSource = self
        
        SepetRouter.createModule(ref: self)
        
        sepetPresenterNesnesi?.sepeteYemekleriYukle(kullanici_adi: "nursema")

        // Do any additional setup after loading the view.
    }
    

    @IBAction func buttonSepetiOnayla(_ sender: Any)
    {
        performSegue(withIdentifier: "toOdeme", sender: nil)

    }
    
    func toplam()
    {
        print("toplandı")
    }
}
 
extension SepetVC : PresenterToViewSepetProtocol
{
        
    func vieweVeriGonder(sepetYemeklerListesi: Array<SepetSinif>)
    {
        self.sepetYemekListe = sepetYemeklerListesi
        DispatchQueue.main.async
        {
            self.sepetTableView.reloadData()
        }
    }
}

extension SepetVC : UITableViewDelegate, UITableViewDataSource
{
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return sepetYemekListe.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let sepet = sepetYemekListe[indexPath.row]
        let hucre = tableView.dequeueReusableCell(withIdentifier: "sepetHucre", for: indexPath) as! SepetTableViewCell
            
        hucre.sepetYemekAdLabel.text = sepet.yemek_adi
        hucre.sepetFiyatLabel.text = "\(sepet.yemek_fiyat!) ₺"
        hucre.sepetAdetLabel.text = "\(sepet.yemek_siparis_adet!)"
        
        let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(sepet.yemek_resim_adi!)")
        hucre.sepetImageView.kf.setImage(with: url)
  
        return hucre
    }
        
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
            
            let silAction = UIContextualAction(style: .destructive, title: "Sil"){ (action,view,void) in
            let yemek = self.sepetYemekListe[indexPath.row]
                
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(yemek.yemek_adi!) silinsin mi?", preferredStyle: .alert)
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel){ action in }
            alert.addAction(iptalAction)
                
            let evetAction = UIAlertAction(title: "Evet", style: .destructive){ action in
            self.sepetPresenterNesnesi?.sepetYemekSil(sepet_yemek_id: Int(yemek.sepet_yemek_id!)!, kullanici_adi: yemek.kullanici_adi)
            }
            alert.addAction(evetAction)
            self.present(alert, animated: true)
        }
            
            return UISwipeActionsConfiguration(actions: [silAction])
    }
        
}
