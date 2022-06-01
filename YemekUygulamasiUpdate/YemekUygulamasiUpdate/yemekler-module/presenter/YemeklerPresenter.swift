//
//  YemeklerPresenter.swift
//  YemekUygulamasiUpdate
//
//  Created by Nursema Nakiboğlu on 31.05.2022.
//

import Foundation

class YemeklerPresenter : ViewToPresenterYemeklerProtocol{
    
    var yemeklerInteractor: PresenterToInteractorYemeklerProtocol?
    
    var yemeklerView: PresenterToViewYemeklerProtocol?
    
    func tumYemekleriYukle() {
        yemeklerInteractor?.tumYemekler()
    }
    
}

extension YemeklerPresenter : InteractorToPresenterYemeklerProtocol
{
    func presenteraVeriGonder(yemeklerListesi: Array<YemekSinif>)
    {
        yemeklerView?.vieweVeriGonder(yemeklerListesi: yemeklerListesi)
    }
}
