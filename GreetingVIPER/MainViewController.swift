//
//  ViewController.swift
//  VIPER
//
//  Created by Кирилл on 17.03.2024.
//

import UIKit

class MainViewController: UIViewController {
    
    private let label = UILabel()
    
    private var person: Person!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Touch me"
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 30)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        person = Person(name: "Bob", surname: "Dark")
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        label.text = "Hello, Mr. \(person.name) \(person.surname)"
    }

}

