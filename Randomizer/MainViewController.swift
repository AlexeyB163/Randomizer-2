//
//  ViewController.swift
//  Randomizer
//
//  Created by Alexey Efimov on 11.02.2021 - Lessons.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setNewValues(for minimumNumber: String, and maximumNumber: String)
}

class MainViewController: UIViewController {
    
    @IBOutlet var minimumValueLabel: UILabel!
    @IBOutlet var maximumValueLabel: UILabel!
    @IBOutlet var randomValueLabel: UILabel!
    
    @IBOutlet var getRandomNumberButton: UIButton!
    
    private var randomNumber = RandomNumber(minimumValue: 1, maximumValue: 100)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getRandomNumberButton.layer.cornerRadius = 10
        minimumValueLabel.text = String(randomNumber.minimumValue)
        maximumValueLabel.text = String(randomNumber.maximumValue)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navigationVC = segue.destination as? UINavigationController else { return }
        guard let settingsVC = navigationVC.topViewController as? SettingsViewController else { return }
        settingsVC.randomNumber = randomNumber

    }

    @IBAction func getRandomNumberButtonTapped() {
        randomValueLabel.text = String(randomNumber.getRandom)
    }
    
}

extension MainViewController: SettingsViewControllerDelegate {
    func setNewValues(for minimumNumber: String, and maximumNumber: String) {
        minimumValueLabel.text = minimumNumber
        maximumValueLabel.text = maximumNumber
    }
    
    
}
