//
//  DetayPresenter.swift
//  YemekUygulamasiUpdate
//
//  Created by Nursema Nakiboğlu on 31.05.2022.
//

import Foundation


class DetayPresenter : ViewToPresenterDetayProtocol
{
    
    var yemekDetayInteractor: PresenterToInteractorDetayProtocol?

    func sepeteEkle(yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: Int, yemek_adet: Int, kullanici_adi:String)
    {
        yemekDetayInteractor?.ekle(yemek_adi: yemek_adi, yemek_resim_adi: yemek_resim_adi, yemek_fiyat: yemek_fiyat, yemek_adet: yemek_adet, kullanici_adi: kullanici_adi)
    }
}


