//
//  SecondViewController.swift
//  CookiesFactory
//
//  Created by Карина on 20.12.2022.
//

import UIKit

//MARK: - Second View Controller
final class SecondViewController: UIViewController {
    
    // MARK: - Private Property
    
    private let cookiesFactoryTwo = CustomLabel(title: "",
                                                color: .black)
    private let backButton = CustomButton(title: "Назад",
                                          backgroundColor: .systemBlue,
                                          isShadow: true)
    
    var firstLabel = ""
    var delegate: SecondViewControllerDelegate!
    

    // MARK: - Ovverride method
    override func viewDidLoad() {
        super.viewDidLoad()
        settingView()
        setupLabel()
    
    }
    
   private func setupLabel() {
        cookiesFactoryTwo.text = firstLabel
    }
    
   
  @objc
    private func backHome() {
        delegate.sendText("Печенье готово")
        dismiss(animated: true)
    }
    
    
}

// MARK: - Setting View
private extension SecondViewController {
    func settingView() {
        view.backgroundColor = .white
        addSubview()
        setupLayout()
        addAction()
    }
   
}

// MARK: - Setting
private extension SecondViewController {
    func addSubview() {
        [cookiesFactoryTwo, backButton].forEach { subview in
            view.addSubview(subview)
        }
    }
    func addAction() {
        backButton.addTarget(self,
                             action: #selector(backHome),
                             for: .touchUpInside)
    }
    
}

// MARK: - Layout
private extension SecondViewController {
    func setupLayout() {
        [cookiesFactoryTwo, backButton].forEach { subview in
            subview.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            cookiesFactoryTwo.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            cookiesFactoryTwo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backButton.topAnchor.constraint(equalTo: cookiesFactoryTwo.bottomAnchor, constant: 50),
            backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
}
