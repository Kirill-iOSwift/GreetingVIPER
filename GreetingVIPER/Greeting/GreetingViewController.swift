//
//  GreetingViewController.swift
//  GreetingVIPER
//
//  Created by Кирилл on 17.03.2024.
//

import UIKit

///Пресентер передает вью данные
protocol GreetingViewInputProtocol: AnyObject {
    /// Все методы этого протокола простые,
    /// говорят что нужна взять параметры и вставить в свойства класса
    func setGreeting(_ greeting: String)
}

///Вью уведомляет пресентер о каких либо событиях
protocol GreetingViewOutputProtocol {
    ///пресентор сможет вызвать у своойства view метод setGreeting
    ///чтоб передать данные
    init(view: GreetingViewInputProtocol)
    ///Метод - вью уведомляет пресентор
    func didTapShowGreeting()
    
}

final class GreetingViewController: UIViewController {
    
    //MARK: - Properties
    
    private let greetinglabel = UILabel()
    private let configurator: GreetingConfiguratorInputProtocol = GreetingConfiguretor()
    
    var presenter: GreetingViewOutputProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(withView: self)
        setupView()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        presenter.didTapShowGreeting()
    }
    
    //MARK: - Private Methods
    ///Метод настройки вью
    private func setupView() {
        view.backgroundColor = .lightGray
        
        view.addSubview(greetinglabel)
        greetinglabel.translatesAutoresizingMaskIntoConstraints = false
        greetinglabel.text = "Touch me!"
        greetinglabel.font = UIFont(name: "HelveticaNeue-Bold", size: 30)
        
        NSLayoutConstraint.activate([
            greetinglabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            greetinglabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

//MARK: - GreetingViewInputProtocol

extension GreetingViewController: GreetingViewInputProtocol {
    func setGreeting(_ greeting: String) {
        greetinglabel.text = greeting
    }
}
