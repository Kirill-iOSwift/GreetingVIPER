//
//  GreetingConfigurator.swift
//  GreetingVIPER
//
//  Created by Кирилл on 17.03.2024.
//

import Foundation

protocol GreetingConfiguratorInputProtocol {
    /// Принимает параметр
    func configure(withView view: GreetingViewController)
}

final class GreetingConfiguretor: GreetingConfiguratorInputProtocol {
    func configure(withView view: GreetingViewController) {
        ///Вью связано с пресентером
        let presentor = GreetingPresenter(view: view)
        view.presenter = presentor
        ///Пресентер связан с вью
        let interactor = GreetingInteractor(presenter: presentor)
        presentor.interactor = interactor
    }
}
