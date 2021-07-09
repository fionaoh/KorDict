//
//  SeeEntryViewController.swift
//  KorDict
//
//  Created by Fiona Oh on 7/9/21.
//

import UIKit

class SeeEntryViewController: UIViewController {
    
    var previousVC = EntriesTableViewController()
    var selectedEntry = Entry()
    @IBOutlet weak var termLabel: UILabel!
    @IBOutlet weak var translationLable: UILabel!
    @IBOutlet weak var notesView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if selectedEntry.isStarred {
            termLabel.text = "Term: " + selectedEntry.term + "⭐️"
        } else {
            termLabel.text = "Translation: " + selectedEntry.term
        }
        
        translationLable.text = selectedEntry.translation
        
        notesView.text = selectedEntry.notes
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
