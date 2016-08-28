//
//  ViewController.swift
//  DogData
//
//  Created by hisham hawara on 2016-08-18.
//  Copyright © 2016 Hisham Hawara. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var dogs : Results<Dog>?
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    override func viewWillAppear(animated: Bool) {
        updateUI()
    }
    func updateUI() {
        do{
            let realm = try Realm()
            self.dogs = realm.objects(Dog)
        }
        catch{}
        self.tableView.reloadData()

    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let dog =  self.dogs![indexPath.row]
        cell.textLabel!.text = "\(dog.name) is \(dog.age) years old!"
        return cell
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dogs!.count
    }
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            let dog =  self.dogs![indexPath.row]
            do{
            let realm = try Realm()
            try realm.write {
                realm.delete(dog)
                }
            }
            catch{}
            updateUI()
        }
    }


}

