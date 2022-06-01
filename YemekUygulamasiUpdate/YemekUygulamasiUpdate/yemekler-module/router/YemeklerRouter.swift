//
//  YemeklerRouter.swift
//  YemekUygulamasiUpdate
//
//  Created by Nursema Nakiboğlu on 31.05.2022.
//

import Foundation

class YemeklerRouter : PresenterToRouterYemeklerProtocol
{
    static func createModule(ref: YemeklerVC)
    {
        let presenter = YemeklerPresenter()
        
        //view
        ref.yemeklerPresenterNesnesi = presenter
        //presenter
        ref.yemeklerPresenterNesnesi?.yemeklerInteractor = YemeklerInteractor()
        ref.yemeklerPresenterNesnesi?.yemeklerView = ref
        //interactor
        ref.yemeklerPresenterNesnesi?.yemeklerInteractor?.yemeklerPresenter = presenter
    }
}
