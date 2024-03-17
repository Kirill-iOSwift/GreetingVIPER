//
//  GreetingInteractor.swift
//  GreetingVIPER
//
//  Created by Кирилл on 17.03.2024.
//

import Foundation

protocol GreetingInteractorInputProtocol {
    ///обращение итерактора к пресентеру
    init(presenter: GreetingInteractorOunputProtocol)
    ///Метод начала сьора данных
    func provideGreetingData()
}

///под него пописывается пресентор
protocol GreetingInteractorOunputProtocol: AnyObject {
    ///Метод для передачи данных к пресентеру
    func receivrGreetingData(_ greetingData: GreetingData)
}

final class GreetingInteractor: GreetingInteractorInputProtocol {
    
    unowned private let presenter: GreetingInteractorOunputProtocol
    
    required init(presenter: GreetingInteractorOunputProtocol) {
        self.presenter = presenter
    }
    
    func provideGreetingData() {
        let person = Person(name: "Dirty", surname: "Fingers")
        let greetingData = GreetingData(name: person.name, surname: person.surname)
        presenter.receivrGreetingData(greetingData)
    }
}
