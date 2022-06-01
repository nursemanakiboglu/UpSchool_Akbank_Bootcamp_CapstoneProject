//
//  YemeklerInteractor.swift
//  YemekUygulamasiUpdate
//
//  Created by Nursema Nakiboğlu on 31.05.2022.
//

import Foundation
import Kingfisher

class YemeklerInteractor : PresenterToInteractorYemeklerProtocol
{
    var yemeklerPresenter: InteractorToPresenterYemeklerProtocol?
    
    func tumYemekler()
    {
        
        //GET
        let url = URL(string: "http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php")!
                
        URLSession.shared.dataTask(with: url)
        { data,response,error in
            if error != nil || data == nil
            {
                print("Hata")
                return
            }
                    
            do
            {
                let cevap = try JSONDecoder().decode(YemekCevap.self, from: data!)
                if let liste = cevap.yemekler
                {
                    self.yemeklerPresenter?.presenteraVeriGonder(yemeklerListesi: liste)
                }
             }catch{print(error.localizedDescription)}
        }.resume()
    }
    
}
