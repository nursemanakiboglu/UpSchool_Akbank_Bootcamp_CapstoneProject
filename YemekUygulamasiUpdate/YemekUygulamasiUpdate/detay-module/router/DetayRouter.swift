//
//  DetayRouter.swift
//  YemekUygulamasiUpdate
//
//  Created by Nursema Nakiboğlu on 31.05.2022.
//

import Foundation

class DetayRouter : PresenterToRouterDetayProtocol
{
    static func createModule(ref: DetayVC)
    {
        ref.yemekDetayPresenterNesnesi = DetayPresenter()
        ref.yemekDetayPresenterNesnesi?.yemekDetayInteractor = DetayInteractor()
        
    }
}
