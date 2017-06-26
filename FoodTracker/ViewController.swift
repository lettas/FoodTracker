//
//  ViewController.swift
//  FoodTracker
//
//  Created by Toru Matsuoka on 2017/06/24.
//  Copyright © 2017年 Toru Matsuoka. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    // MARK: Properties
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
    }

    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        mealNameLabel.text = textField.text
    }

    // MARK: Actions
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        mealNameLabel.text = "Default Text"
    }
}

