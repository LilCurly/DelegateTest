//
//  ViewController.swift
//  DelegateTest
//
//  Created by Roman Muzikantov on 16/08/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mTableView: UITableView!
    @IBOutlet weak var mSegmentedControl: UISegmentedControl!
    
    var persons = [PersonModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mTableView.register(UINib(nibName: CustomTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: CustomTableViewCell.identifier)
        mTableView.dataSource = self
        mTableView.delegate = self
        
        mSegmentedControl.removeAllSegments()
        mSegmentedControl.insertSegment(withTitle: "Batch 1", at: 0, animated: true)
        mSegmentedControl.insertSegment(withTitle: "Batch 2", at: 1, animated: true)
        
        mSegmentedControl.addTarget(self, action: #selector(didTapSegmentedControl(segmentedControl:)), for: .valueChanged)
        
        mSegmentedControl.selectedSegmentIndex = 0
        loadFirstBatch()
    }
    
    func loadFirstBatch() {
        persons.removeAll()
        persons.append(PersonModel(name: "Roman", desc: "Fleur"))
        persons.append(PersonModel(name: "Fred", desc: "Lunette"))
        persons.append(PersonModel(name: "Axel", desc: "Ordi"))
        persons.append(PersonModel(name: "David", desc: "Casquette"))
        
        mTableView.reloadData()
    }
    
    func loadSecondBatch() {
        persons.removeAll()
        persons.append(PersonModel(name: "Loic", desc: "Fleur"))
        persons.append(PersonModel(name: "Nico", desc: "Lunette"))
        persons.append(PersonModel(name: "Alex", desc: "Ordi"))
        persons.append(PersonModel(name: "Antoine", desc: "Casquette"))
        
        mTableView.reloadData()
    }
    
    @objc func didTapSegmentedControl(segmentedControl: UISegmentedControl) {
        if segmentedControl.selectedSegmentIndex == 0 {
            loadFirstBatch()
        } else {
            loadSecondBatch()
        }
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier) as! CustomTableViewCell
        cell.titleLbl.text = persons[indexPath.row].name
        cell.descriptionLbl.text = persons[indexPath.row].desc
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let person = persons[indexPath.row]
        let alert = UIAlertController(title: person.name, message: person.desc, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

