//
//  ViewController.swift
//  objc_associatedObject_test
//
//  Created by Ara Hakobyan on 6/25/19.
//  Copyright © 2019 Ara Hakobyan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let string: Box<String?> = Box("Poxos")

    private lazy var oneCommand = Command { [weak self] sender  in
        self?.string.value = "Ara"
    }
    
    private lazy var twoCommand = Command { [weak self] sender  in
        self?.string.value = "Armen"
    }

    private lazy var label: UILabel = {
        let view = UILabel(frame: CGRect(x: 100, y: 100, width: 200, height: 40))
        view.backgroundColor = .red
        view.textAlignment = .center
        return view
    }()
    
    private lazy var oneButton: UIButton = {
        let view = UIButton(frame: CGRect(x: 100, y: 200, width: 200, height: 40))
        view.setTitle("Change Label One", for: .normal)
        view.backgroundColor = .gray
        return view
    }()
    
    private lazy var twoButton: UIButton = {
        let view = UIButton(frame: CGRect(x: 100, y: 300, width: 200, height: 40))
        view.setTitle("Change Label Two", for: .normal)
        view.backgroundColor = .gray
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()

        configBindings()
        setCommands()
    }
}

extension ViewController {
    private func configUI() {
        view.backgroundColor = .blue
        view.addSubview(label)
        view.addSubview(oneButton)
        view.addSubview(twoButton)
    }
    
    private func configBindings() {
        string >> { self.label.text = $0 }
//        string ->>> label.textModifier
//        string ~>>> label
    }
    
    private func setCommands() {
        oneButton |>| oneCommand
        twoButton |>| twoCommand
    }
}
