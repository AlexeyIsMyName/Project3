//
//  FlagListTableViewController.swift
//  Project3
//
//  Created by ALEKSEY SUSLOV on 22.10.2022.
//

import UIKit

class FlagListTableViewController: UITableViewController {
    
    private var flagPaths = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        getFlags()
    }
    
    private func getFlags() {
        let path = Bundle.main.resourcePath!
        let fm = FileManager.default
        let items = try! fm.contentsOfDirectory(atPath: path)
        for item in items {
            if item.hasSuffix("png") {
                flagPaths.append(item)
            }
        }
        flagPaths.sort()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flagPaths.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FlagName", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        var flagName = flagPaths[indexPath.row]
        let firstSpace = flagName.firstIndex(of: ".") ?? flagName.endIndex
        flagName = String(flagName[..<firstSpace])
        
        content.text = flagName + " " + String(indexPath.row)
        cell.contentConfiguration = content
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showFlag", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? FlagViewController else { return }
        guard let index = tableView.indexPathForSelectedRow?.row else { return }
        vc.flagImagePath = flagPaths[index]
    }
}
