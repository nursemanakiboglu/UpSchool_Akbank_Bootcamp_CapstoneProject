//
//  SepetRouter.swift
//  YemekUygulamasiUpdate
//
//  Created by Nursema Nakiboğlu on 31.05.2022.
//

import Foundation

class SepetRouter : PresenterToRouterSepetProtocol
{
    static func createModule(ref: SepetVC)
    {
        let presenter = SepetPresenter()
        
        //view
        ref.sepetPresenterNesnesi = presenter
        //presenter
        ref.sepetPresenterNesnesi?.sepetInteractor = SepetInteractor()
        ref.sepetPresenterNesnesi?.sepetView = ref
        //interactor
        ref.sepetPresenterNesnesi?.sepetInteractor?.sepetPresenter = presenter
    }
}
