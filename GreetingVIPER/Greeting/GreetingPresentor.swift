//
//  GreetingPresentor.swift
//  GreetingVIPER
//
//  Created by Кирилл on 17.03.2024.
//

import Foundation

///Данные для модуля Greeting
struct GreetingData {
    let name: String
    let surname: String
}

final class GreetingPresenter: GreetingViewOutputProtocol {
    ///Слабая ссылка на вью
    unowned private let view: GreetingViewInputProtocol
    var interactor: GreetingInteractorInputProtocol!
    
    required init(view: GreetingViewInputProtocol) {
        self.view = view
    }
    
    func didTapShowGreeting() {
        interactor.provideGreetingData()
    }
}

//MARK: - GreetingInteractorOunputProtocol

extension GreetingPresenter: GreetingInteractorOunputProtocol {
    func receivrGreetingData(_ greetingData: GreetingData) {
        let greeting = "Hello, Mr. \(greetingData.name) \(greetingData.surname)!"
        view.setGreeting(greeting)
    }
}
