//
//  AddViewController.swift
//  19_TODO_2
//
//  Created by bmtech on 17.03.2022.
//

import UIKit
protocol AddName: AnyObject {
    func appName(_ name: String , _ disc: String)
    func appArray(_ name: String , _ disc: String)
}

class AddViewController: UIViewController {

    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldDisc: UITextField!
    
    var delegate: AddName?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func addButton(_ sender: Any) {
        delegate?.appName(textFieldName.text ?? "nil" , textFieldDisc.text ?? "nil")
        delegate?.appArray(textFieldName.text ?? "nil" , textFieldDisc.text ?? "nil")
        dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
        
    }
    
}
