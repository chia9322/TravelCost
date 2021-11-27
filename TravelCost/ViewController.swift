//
//  ViewController.swift
//  TravelCost
//
//  Created by Chia on 2021/11/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var gasolinePriceTextField: UITextField!
    @IBOutlet var fuelEfficiencyTextField: UITextField!
    @IBOutlet var distanceTextField: UITextField!
    
    @IBOutlet var totalPriceLabel: UILabel!
    @IBOutlet var pricePerPersonLabel: UILabel!
    
    var numberOfPeople: Double = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func calculate(_ sender: Any) {
        if let gasolinePrice = Double(gasolinePriceTextField.text!),
           let fuelEfficiency = Double(fuelEfficiencyTextField.text!),
           let distance = Double(distanceTextField.text!) {
            // 計算總金額
            let totalPrice = distance / fuelEfficiency * gasolinePrice
            totalPriceLabel.text = String(format: "%.0f", totalPrice) + "円"
            // 計算每個人平均分攤金額
            let pricePerPerson = totalPrice / numberOfPeople
            pricePerPersonLabel.text = String(format: "%.0f", pricePerPerson) + "円"
        }
        // 按下Calculate按鈕後收鍵盤
        view.endEditing(true)
    }
    
    @IBAction func personButtonPressed(_ sender: UIButton) {
        // 圖示為被選取狀態
        if sender.tag == 1 {
            sender.configuration?.background.image = UIImage(named: "person-disabled")
            sender.tag = 0
            numberOfPeople -= 1
        // 圖示為未選取狀態
        } else {
            sender.configuration?.background.image = UIImage(named: "person-enabled")
            sender.tag = 1
            numberOfPeople += 1
        }
    }
}
