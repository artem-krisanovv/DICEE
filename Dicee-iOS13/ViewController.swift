//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    @IBOutlet weak var rollButton: UIButton!
    
    private var diceNumber = [0, 1, 2, 3, 4, 5]
    private var timer: Timer?
    private var isRolling = false
    
    private let dice = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"),#imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        isRolling.toggle()
        
        if isRolling {
            rollButton?.setTitle("Stop Rolling!", for: .normal)
            startRolling()
        } else {
            rollButton?.setTitle("Roll", for: .normal)
            stopRolling()
        }
    }
    
    private func startRolling() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { [weak self] _ in
            self?.updateDice()
        }
    }
    
    private func stopRolling() {
        updateDice()
        timer?.invalidate()
        timer = nil
    }
    
    private func updateDice() {
        diceImageView1.image = dice[diceNumber.randomElement() ?? 0]
        diceImageView2.image = dice[diceNumber.randomElement() ?? 0]
    }
}
