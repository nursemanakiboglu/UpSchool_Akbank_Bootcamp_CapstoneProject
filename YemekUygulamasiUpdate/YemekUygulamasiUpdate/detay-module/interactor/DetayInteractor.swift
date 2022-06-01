//
//  DetayInteractor.swift
//  YemekUygulamasiUpdate
//
//  Created by Nursema Nakiboğlu on 31.05.2022.
//

import Foundation

class DetayInteractor : PresenterToInteractorDetayProtocol
{
    func ekle(yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: Int, yemek_adet: Int,kullanici_adi:String)
    {
        var istek = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php")!)
        istek.httpMethod = "POST"
        let postString = "yemek_adi=\(yemek_adi)&yemek_fiyat=\(yemek_fiyat)&yemek_resim_adi=\(yemek_resim_adi)&yemek_siparis_adet=\(yemek_adet)&kullanici_adi=\(kullanici_adi)"
        istek.httpBody = postString.data(using: .utf8)
                
        URLSession.shared.dataTask(with: istek){ data,response,error in
            if error != nil || data == nil {
                print("Hata")
                return
            }
                    
            do
            {
                let cevap = try JSONSerialization.jsonObject(with: data!)
                print(cevap)
             }catch{print(error.localizedDescription)}
        }.resume()
    }
    
}
