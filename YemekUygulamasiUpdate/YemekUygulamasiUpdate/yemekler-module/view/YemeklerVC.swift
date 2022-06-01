//
//  YemeklerVC.swift
//  YemekUygulamasiUpdate
//
//  Created by Nursema Nakiboğlu on 31.05.2022.
//

import UIKit
import Kingfisher

class YemeklerVC: UIViewController
{

    @IBOutlet weak var yemeklerTableView: UITableView!
    
    var yemekListe = [YemekSinif]()
    
    var yemeklerPresenterNesnesi:ViewToPresenterYemeklerProtocol?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        yemeklerTableView.delegate = self
        yemeklerTableView.dataSource = self
        
        YemeklerRouter.createModule(ref: self)

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        yemeklerPresenterNesnesi?.tumYemekleriYukle()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        
        if segue.identifier == "toDetay"
        {
            if let yemekler = sender as? YemekSinif
            {
                let gidilecekVC = segue.destination as! DetayVC
                gidilecekVC.detay = yemekler
            }
        }
    }
    
}

extension YemeklerVC : PresenterToViewYemeklerProtocol {
    func vieweVeriGonder(yemeklerListesi: Array<YemekSinif>) {
        self.yemekListe = yemeklerListesi
        DispatchQueue.main.async
        {
            self.yemeklerTableView.reloadData()
        }
    }
}


extension YemeklerVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return yemekListe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let yemek = yemekListe[indexPath.row]
        let hucre = tableView.dequeueReusableCell(withIdentifier: "yemekHucre", for: indexPath) as! YemeklerTableViewCell
        
        hucre.yemekAdLabel.text = yemek.yemek_adi
        hucre.yemekFiyatLabel.text = "\(yemek.yemek_fiyat!) ₺"
        //hucre.yemekResimImageView.image = UIImage(named: yemek.yemek_resim_adi!)
        let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(yemek.yemek_resim_adi!)")
        hucre.yemekResimImageView.kf.setImage(with: url)
        hucre.backgroundColor = UIColor(white: 0.95, alpha: 1)
        hucre.hucreArkaplan.layer.cornerRadius = 10.0
        
        return hucre
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let yemek = yemekListe[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: yemek)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

