//
//  SepetProtocols.swift
//  YemekUygulamasiUpdate
//
//  Created by Nursema Nakiboğlu on 31.05.2022.
//

import Foundation

//ana protocoller
protocol ViewToPresenterSepetProtocol
{
    var sepetInteractor:PresenterToInteractorSepetProtocol? {get set}
    var sepetView:PresenterToViewSepetProtocol? {get set}
    
    func sepeteYemekleriYukle(kullanici_adi:String)
    func sepetYemekSil(sepet_yemek_id:Int,kullanici_adi:String)
}

protocol PresenterToInteractorSepetProtocol
{
    var sepetPresenter:InteractorToPresenterSepetProtocol? {get set}
    func sepetYemekler(kullanici_adi:String)
    func yemekSil(sepet_yemek_id:Int,kullanici_adi:String)
}

//Taşıyıcı protocoller
protocol InteractorToPresenterSepetProtocol
{
    func presenteraVeriGonder(sepetYemeklerListesi:Array<SepetSinif>)
}

protocol PresenterToViewSepetProtocol
{
    func vieweVeriGonder(sepetYemeklerListesi:Array<SepetSinif>)
}

//router
protocol PresenterToRouterSepetProtocol {
    static func createModule(ref:SepetVC)
}
