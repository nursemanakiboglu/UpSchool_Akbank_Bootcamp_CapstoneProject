//
//  DetayProtocols.swift
//  YemekUygulamasiUpdate
//
//  Created by Nursema Nakiboğlu on 31.05.2022.
//

import Foundation

protocol ViewToPresenterDetayProtocol
{
    var yemekDetayInteractor:PresenterToInteractorDetayProtocol? {get set}
    
    func sepeteEkle(yemek_adi:String,yemek_resim_adi:String,yemek_fiyat:Int,yemek_adet:Int, kullanici_adi:String)
}

protocol PresenterToInteractorDetayProtocol
{
    func ekle(yemek_adi:String,yemek_resim_adi:String,yemek_fiyat:Int,yemek_adet:Int,kullanici_adi:String)
}

protocol PresenterToRouterDetayProtocol
{
    static func createModule(ref:DetayVC)
}
