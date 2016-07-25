//
//  ViewController.swift
//  PickinFruit
//
//  Created by Flatiron School on 7/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var spinButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var fruitPicker: UIPickerView!
    
    var fruitsArray = ["🍎", "🍊", "🍌", "🍐", "🍇", "🍉", "🍓", "🍒", "🍍"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fruitPicker.accessibilityLabel = Constants.FRUIT_PICKER
        self.spinButton.accessibilityLabel = Constants.SPIN_BUTTON
        
        self.fruitPicker.delegate = self
        self.fruitPicker.dataSource = self
        
    }
    
    @IBAction func spinButtonTapped(sender: UIButton) {
        let firstRandomItemIndex = Int(arc4random_uniform(UInt32(self.fruitsArray.count)))
        let secondRandomItemIndex = Int(arc4random_uniform(UInt32(self.fruitsArray.count)))
        let thirdRandomItemIndex = Int(arc4random_uniform(UInt32(self.fruitsArray.count)))
        
        
        self.fruitPicker.selectRow(firstRandomItemIndex, inComponent: 0, animated: true)
        self.fruitPicker.selectRow(secondRandomItemIndex, inComponent: 1, animated: true)
        self.fruitPicker.selectRow(thirdRandomItemIndex, inComponent: 2, animated: true)
        
        let firstItem = self.fruitsArray[self.fruitPicker.selectedRowInComponent(0)]
        let secondItem = self.fruitsArray[self.fruitPicker.selectedRowInComponent(1)]
        let thirdItem = self.fruitsArray[self.fruitPicker.selectedRowInComponent(2)]
        
        print("\(firstRandomItemIndex) \(secondRandomItemIndex) \(thirdRandomItemIndex)")
        print(firstItem + secondItem + thirdItem)
        
        if firstItem == secondItem && secondItem == thirdItem {
            self.resultLabel?.text = "WINNER!"
        } else {
            self.resultLabel?.text = "TRY AGAIN"
        }
    }
    //DataSource protocol methods
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 3 //3 columns
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.fruitsArray.count
    }
    
    //Delegate protocol methods
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.fruitsArray[row]
    }
    
}

// MARK: Set Up
extension ViewController {
    
    override func viewDidLayoutSubviews() {
        if self.spinButton.layer.cornerRadius == 0.0 {
            configureButton()
        }
    }
    
    func configureButton()
    {
        self.spinButton.layer.cornerRadius = 0.5 * self.spinButton.bounds.size.width
        self.spinButton.layer.borderColor = UIColor.whiteColor().CGColor
        self.spinButton.layer.borderWidth = 4.0
        self.spinButton.clipsToBounds = true
    }
    
}



