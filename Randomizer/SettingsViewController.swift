//
//  SettingsViewController.swift
//  Randomizer
//
//  Created by Alexey Efimov on 11.02.2021.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet var minimumValueTF: UITextField!
    @IBOutlet var maximumValueTF: UITextField!
    
    var randomNumber: RandomNumber!
    var delegate: SettingsViewControllerDelegate!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        minimumValueTF.text = String(randomNumber.minimumValue)
        maximumValueTF.text = String(randomNumber.maximumValue)
    }
    
    @IBAction func cancelButtonPressed() {
        dismiss(animated: true)
    }
    
    @IBAction func saveButtonPressed() {
        delegate.setNewValues(for: minimumValueTF.text ?? "0", and: maximumValueTF.text ?? "100")
        dismiss(animated: true)
    }
}
 
