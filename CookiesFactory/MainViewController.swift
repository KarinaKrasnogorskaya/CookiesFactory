//
//  ViewController.swift
//  CookiesFactory
//
//  Created by Карина on 20.12.2022.
//

import UIKit

protocol SecondViewControllerDelegate {
    func sendText(_ text: String) 
}

// MARK: - MainViewController
final class MainViewController: UIViewController {
    
    // MARK: - Private Property
    
    private let cookiesFactory = UIImageView()
    private let processLabel = CustomLabel(title: "Приготовить печенье?", color: .black)
    private let goButton = CustomButton(title: "Готовить", backgroundColor: .systemBlue, isShadow: true)
    
   

    // MARK: - Ovverride method
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVeiew()
    }
    
    @objc
    private func secondVC() {
        let secondVC = SecondViewController()
        secondVC.firstLabel = "Печенье почти готово, вернись назад"
        secondVC.delegate = self
        present(secondVC, animated: true)
    }

}

// MARK: - Setting View

private extension MainViewController {
    func setupVeiew() {
        view.backgroundColor = .white
        addSubview()
        setupImage()
        setupLayout()
        addAction()
    }
  
}

// MARK: - Setting

private extension MainViewController {
    
    func addSubview() {
        [cookiesFactory, processLabel, goButton].forEach { subView in
            view.addSubview(subView)
        }
    }
    
    func setupImage() {
        cookiesFactory.image = UIImage(named: "factory")
        cookiesFactory.contentMode = .scaleAspectFill
    }
    
    func addAction() {
        goButton.addTarget(self, action: #selector(secondVC), for: .touchUpInside)
    }
    
}

// MARK: - Layout

private extension MainViewController {
    func setupLayout() {
        [cookiesFactory, processLabel, goButton].forEach { subview in
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            cookiesFactory.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            cookiesFactory.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            processLabel.topAnchor.constraint(equalTo: cookiesFactory.bottomAnchor, constant: 50),
            processLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            goButton.topAnchor.constraint(equalTo: processLabel.bottomAnchor, constant: 50),
            goButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        
        ])
    }
}

extension MainViewController: SecondViewControllerDelegate {
    func sendText(_ text: String) {
        processLabel.text = text
    }
}
