//
//  ViewController.swift
//  Counter
//
//  Created by Sofya Tarnalitskaya on 30/12/2024.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet private weak var minusButton: UIButton!
  @IBOutlet private weak var plusButton: UIButton!
  @IBOutlet private weak var restartButton: UIButton!
  
  @IBOutlet private weak var textView: UITextView!
  @IBOutlet private weak var counterLabel: UILabel!
  private var counter: Int = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    updateCounterLabel()
    textView.isEditable = false
  }

  @IBAction private func countMinus(_ sender: Any) {
    let formattedDate = defineCurrentTime()
    if counter > 0 {
      counter -= 1
      updateCounterLabel()
      textView.text += "\n\(formattedDate) - значение изменено на -1"
    } else {
      textView.text += "\n\(formattedDate) - попытка уменьшить значение счётчика ниже 0"
    }
  }
  
  @IBAction private func countPlus(_ sender: Any) {
    let formattedDate = defineCurrentTime()
    counter += 1
    updateCounterLabel()
    textView.text += "\n\(formattedDate) - значение изменено на +1"
  }
  
  @IBAction private func countRestart(_ sender: Any) {
    let formattedDate = defineCurrentTime()
    counter = 0
    updateCounterLabel()
    textView.text += "\n\(formattedDate) - значение сброшено"
  }
  
  private func updateCounterLabel() {
    counterLabel.text = "Значение счётчика - \(counter)"
  }
  
  private func defineCurrentTime() -> String {
    let currentDate = Date()
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "ru_RU")
    formatter.dateFormat = "dd MMMM yyyy HH:mm:ss"
    
    return formatter.string(from: currentDate)
  }
}

