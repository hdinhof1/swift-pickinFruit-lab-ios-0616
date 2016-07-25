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
    
    private let numberOfRows = 1000
    
    var fruitsArray = ["🍎", "🍊", "🍌", "🍐", "🍇", "🍉", "🍓", "🍒", "🍍"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fruitPicker.accessibilityLabel = Constants.FRUIT_PICKER
        self.spinButton.accessibilityLabel = Constants.SPIN_BUTTON
        
        self.fruitPicker.delegate = self
        self.fruitPicker.dataSource = self
        
        setFruitsStartingPosition()
        
    }
    
    @IBAction func spinButtonTapped(sender: UIButton) {
        let firstRandomRowInPicker = Int(arc4random_uniform(UInt32(numberOfRows)))
        let secondRandomRowInPicker = Int(arc4random_uniform(UInt32(numberOfRows)))
        let thirdRandomRowInPicker = Int(arc4random_uniform(UInt32(numberOfRows)))
        
        
        self.fruitPicker.selectRow(firstRandomRowInPicker, inComponent: 0, animated: true)
        self.fruitPicker.selectRow(secondRandomRowInPicker, inComponent: 1, animated: true)
        self.fruitPicker.selectRow(thirdRandomRowInPicker, inComponent: 2, animated: true)
        
        let firstItem = self.fruitsArray[self.fruitPicker.selectedRowInComponent(0) % self.fruitsArray.count]
        let secondItem = self.fruitsArray[self.fruitPicker.selectedRowInComponent(1) % self.fruitsArray.count]
        let thirdItem = self.fruitsArray[self.fruitPicker.selectedRowInComponent(2) % self.fruitsArray.count]
        
        
        print("\(firstRandomRowInPicker % self.fruitsArray.count) \(secondRandomRowInPicker % self.fruitsArray.count) \(thirdRandomRowInPicker % self.fruitsArray.count)")
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
        return numberOfRows
    }
    
    //Delegate protocol methods
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.fruitsArray[row % self.fruitsArray.count]
    }
    
    func setFruitsStartingPosition() {
        
        self.fruitPicker.selectRow(4, inComponent: 0, animated: false)
        self.fruitPicker.selectRow(5, inComponent: 1, animated: false)
        self.fruitPicker.selectRow(6, inComponent: 2, animated: false)
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



