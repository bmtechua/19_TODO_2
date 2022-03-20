//
//  ViewController.swift
//  19_TODO_2
//
//  Created by bmtech on 17.03.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myTable: UITableView!
    var identifier = "cell"
    var arr: [Data] = []
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTable()
        
        
    }
    func createTable () {
        myTable.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        self.myTable.delegate = self
        self.myTable.dataSource = self
        
        view.addSubview(myTable)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? AddViewController else {
            return
        }
        vc.delegate = self
    }
   
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        let item = arr[indexPath.row]
       
        var content = cell.defaultContentConfiguration()
        content.text = "text"
        content.secondaryText = "test"
        cell.contentConfiguration = content
        
        
        return cell
    }
}

extension ViewController: AddName {
    func appName(_ name: String, _ disc: String) {
        nameLabel.text = name
        descLabel.text = disc
    }
    
    func appArray(_ name: String, _ disc: String) {
        arr.append(Data(name: name, desc: disc))
        
        print(arr.count)
    }
    
    
}
