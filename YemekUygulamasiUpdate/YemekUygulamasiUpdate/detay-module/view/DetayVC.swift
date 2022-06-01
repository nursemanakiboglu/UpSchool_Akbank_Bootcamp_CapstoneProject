//
//  DetayVC.swift
//  YemekUygulamasiUpdate
//
//  Created by Nursema Nakiboğlu on 31.05.2022.
//

import UIKit

//CacoaTouchClass //UIViewController

class DetayVC: UIViewController
{
    @IBOutlet weak var yemekImageView: UIImageView!
    @IBOutlet weak var yemekAdiLabel: UILabel!
    @IBOutlet weak var fiyatLabel: UILabel!
    @IBOutlet weak var stepperAdetLabel: UILabel!
    @IBOutlet weak var adetLabel: UILabel!
    
    var detay:YemekSinif?
    var yemekDetayPresenterNesnesi:ViewToPresenterDetayProtocol?
    var sayi = 0
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        if let y = detay
        {
            yemekImageView.image = UIImage(named: y.yemek_resim_adi!)
            yemekAdiLabel.text = y.yemek_adi
            fiyatLabel.text = "\(y.yemek_fiyat!) ₺"
            let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(y.yemek_resim_adi!)")
            yemekImageView.kf.setImage(with: url)
        }
        
        DetayRouter.createModule(ref: self)
    }
    
    
    @IBAction func buttonArti(_ sender: Any)
    {
        adetArttirma()
    }
    
    
    @IBAction func buttonEksi(_ sender: Any)
    {
        adetEksiltme()
    }
    
    
    @IBAction func sepeteEkleButton(_ sender: Any)
    {
        yemekDetayPresenterNesnesi?.sepeteEkle(yemek_adi: (detay?.yemek_adi)!, yemek_resim_adi: (detay?.yemek_resim_adi)!, yemek_fiyat: Int((detay?.yemek_fiyat)!)!, yemek_adet: Int(stepperAdetLabel.text!)!, kullanici_adi: "nursema")
    }
  
    func adetArttirma()
    {
        sayi = sayi + 1
        stepperAdetLabel.text = String(sayi)
    }
    
    func adetEksiltme()
    {
        sayi = sayi - 1
        stepperAdetLabel.text = String(sayi)
        
        if sayi < 0
        {
            stepperAdetLabel.text = "0"
        }
    }
}
