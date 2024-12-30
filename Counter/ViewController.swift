//
//  ViewController.swift
//  Counter
//
//  Created by Sofya Tarnalitskaya on 30/12/2024.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var minusButton: UIButton!
  @IBOutlet weak var plusButton: UIButton!
  @IBOutlet weak var restartButton: UIButton!
  
  @IBOutlet weak var textView: UITextView!
  @IBOutlet weak var counterLabel: UILabel!
  var counter: Int = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    updateCounterLabel()
    textView.isEditable = false
  }

  // Buttons Actions (plus, minus, restart)
  @IBAction func countMinus(_ sender: Any) {
    let formattedDate = defineCurrentTime()
    if counter > 0 {
      counter -= 1
      updateCounterLabel()
      textView.text += "\n\(formattedDate) - значение изменено на -1"
    } else {
      textView.text += "\n\(formattedDate) - попытка уменьшить значение счётчика ниже 0"
    }
  }
  
  @IBAction func countPlus(_ sender: Any) {
    let formattedDate = defineCurrentTime()
    counter += 1
    updateCounterLabel()
    textView.text += "\n\(formattedDate) - значение изменено на +1"
  }
  
  @IBAction func countRestart(_ sender: Any) {
    let formattedDate = defineCurrentTime()
    counter = 0
    updateCounterLabel()
    textView.text += "\n\(formattedDate) - значение сброшено"
  }
  
  // Update Counter Label
  private func updateCounterLabel() {
    counterLabel.text = "Значение счётчика - \(counter)"
  }
  
  // Define current time
  private func defineCurrentTime() -> String {
    let currentDate = Date()
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "ru_RU")
    formatter.dateFormat = "dd MMMM yyyy HH:mm:ss"
    
    return formatter.string(from: currentDate)
  }
}

