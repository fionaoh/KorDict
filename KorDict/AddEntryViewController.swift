//
//  AddEntryViewController.swift
//  KorDict
//
//  Created by Fiona Oh on 7/8/21.
//

import UIKit

class AddEntryViewController: UIViewController {

    @IBOutlet weak var termTextField: UITextField!
    @IBOutlet weak var translationTextField: UITextField!
    @IBOutlet weak var starSwitch: UISwitch!
    @IBOutlet weak var notesTextView: UITextView!
    
    var previousVC = EntriesTableViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func addEntry(_ sender: UIButton) {
        
        let entry = Entry()
        
        if let termText = termTextField.text {
            entry.term = termText
            entry.translation = translationTextField.text!
            entry.notes = notesTextView.text!
            entry.isStarred = starSwitch.isOn
        }
        
        previousVC.entries.append(entry)
        previousVC.tableView.reloadData()
        navigationController?.popViewController(animated: true)
        
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    

}
