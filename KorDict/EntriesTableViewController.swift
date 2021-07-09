//
//  EntriesTableViewController.swift
//  KorDict
//
//  Created by Fiona Oh on 7/7/21.
//

import UIKit

class EntriesTableViewController: UITableViewController {
    
    var entries : [Entry] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        entries = createEntries()
    }
    
    func createEntries() -> [Entry] {
        let entry1 = Entry()
        entry1.term = "불행"
        entry1.translation = "unhappiness"
        entry1.isStarred = true
        
        let entry2 = Entry()
        entry2.term = "뱃사람"
        entry2.translation = "sailor"
        
        return [entry1, entry2]
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entries.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let entry = entries[indexPath.row]
        
        if entry.isStarred {
            cell.textLabel?.text = "⭐️ " + entry.term
        } else {
            cell.textLabel?.text = entry.term
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let entry = entries[indexPath.row]
        
        performSegue(withIdentifier: "moveToView", sender: entry)
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addVC = segue.destination as? AddEntryViewController {
            addVC.previousVC = self
        }
        
        if let seeVC = segue.destination as? SeeEntryViewController {
            if let entry = sender as? Entry {
                seeVC.selectedEntry = entry
                seeVC.previousVC = self
            }
        }
    }
    

}
