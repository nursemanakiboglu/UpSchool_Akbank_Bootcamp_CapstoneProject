//
//  YemeklerProtocols.swift
//  YemekUygulamasiUpdate
//
//  Created by Nursema Nakiboğlu on 31.05.2022.
//

import Foundation

//Ana protocoller
protocol ViewToPresenterYemeklerProtocol
{
    var yemeklerInteractor:PresenterToInteractorYemeklerProtocol? {get set}
    var yemeklerView:PresenterToViewYemeklerProtocol? {get set}
    
    func tumYemekleriYukle()
    
}

protocol PresenterToInteractorYemeklerProtocol
{
    var yemeklerPresenter:InteractorToPresenterYemeklerProtocol? {get set}
    
    func tumYemekler()
}

//Taşıyıcı protocoller 
protocol InteractorToPresenterYemeklerProtocol
{
    func presenteraVeriGonder(yemeklerListesi:Array<YemekSinif>)
}

protocol PresenterToViewYemeklerProtocol
{
    func vieweVeriGonder(yemeklerListesi:Array<YemekSinif>)
}

//Router
protocol PresenterToRouterYemeklerProtocol
{
    static func createModule(ref:YemeklerVC)
}
