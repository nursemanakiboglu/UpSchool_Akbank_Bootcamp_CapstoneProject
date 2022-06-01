//
//  SepetPresenter.swift
//  YemekUygulamasiUpdate
//
//  Created by Nursema Nakiboğlu on 31.05.2022.
//

import Foundation

class SepetPresenter : ViewToPresenterSepetProtocol
{
    
    var sepetInteractor: PresenterToInteractorSepetProtocol?
    var sepetView: PresenterToViewSepetProtocol?
    
    func sepeteYemekleriYukle(kullanici_adi: String) {
        sepetInteractor?.sepetYemekler(kullanici_adi: kullanici_adi)
    }
    
    func sepetYemekSil(sepet_yemek_id: Int, kullanici_adi: String) {
        sepetInteractor?.yemekSil(sepet_yemek_id: sepet_yemek_id, kullanici_adi: kullanici_adi)
    }
    
}

extension SepetPresenter : InteractorToPresenterSepetProtocol
{
    func presenteraVeriGonder(sepetYemeklerListesi: Array<SepetSinif>)
    {
        sepetView?.vieweVeriGonder(sepetYemeklerListesi: sepetYemeklerListesi)
    }
}
