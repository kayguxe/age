//
//  addDogViewController.swift
//  DogData
//
//  Created by hisham hawara on 2016-08-19.
//  Copyright © 2016 Hisham Hawara. All rights reserved.
//

import UIKit
import RealmSwift

class addDogViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var nameTextFeild: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.picker.dataSource = self
        self.picker.delegate = self
    }

    @IBAction func saveTapped(sender: AnyObject) {
        let dogAge = self.picker.selectedRowInComponent(0)
        let dogName = self.nameTextFeild.text!
        let dog = Dog()
        dog.name = dogName
        dog.age = dogAge
        do{
            let realm = try Realm()
            try realm.write {
                realm.add(dog)
            }
        }
        catch{}
        self.navigationController?.popViewControllerAnimated(true)
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 101
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row)"
    }


}
