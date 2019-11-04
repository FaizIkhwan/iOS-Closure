//
//  PayViewController.swift
//  TestClosure
//
//  Created by Faiz Ikhwan on 04/11/2019.
//  Copyright © 2019 Faiz Ikhwan. All rights reserved.
//

import UIKit

class PayViewController: UIViewController, Storyboarded {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var enterAmountTextField: UITextField!
    
    //    typealias doubleClosure = ((Double?) -> Void)
    var onCompletion: ((Double?) -> Void)?
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabel()
    }
    
    func setupLabel() {
        guard let name = name else { return }
        nameLabel.text = name
    }
    
    @IBAction func payButtonPressed(_ sender: UIButton) {
        guard let value = enterAmountTextField.text else { return }
        onCompletion?(Double(value))
        dismiss(animated: true)
    }
    
}
