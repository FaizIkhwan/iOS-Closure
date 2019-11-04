//
//  DisplayAmountViewController.swift
//  TestClosure
//
//  Created by Faiz Ikhwan on 04/11/2019.
//  Copyright © 2019 Faiz Ikhwan. All rights reserved.
//

import UIKit

class DisplayAmountViewController: UIViewController {

    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    
    var currentBalance: Double? = 0.0 {
        didSet {
            guard let currentBalance = currentBalance else { return }
            amountLabel.text = "\(currentBalance)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func topUpButtonOnPressed(_ sender: UIButton) {
        guard let name = nameTextField.text else { return }
        
        let payVC = PayViewController.instantiate(storyboardName: Constant.Main)
        payVC.name = name
        payVC.onCompletion = { (value) in
            guard let value = value else { return }
            self.currentBalance? += value                        
        }
        present(payVC, animated: true)
    }
}


// 1 present view controller programmatically
// 2 pass variable to presented view controller
// 3 after dismiss, pass back another variable to presenting view controller
