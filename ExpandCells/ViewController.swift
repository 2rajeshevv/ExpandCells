//
//  ViewController.swift
//  ExpandCells
//
//  Created by Saanvi Shingarwad on 02/10/21.
//

import UIKit

class Section {
    
    let title: String
    let data: [String]
    var isOpened: Bool = false
    
    init(title: String, data: [String], isOpened: Bool = false) {
        self.title = title
        self.data = data
        self.isOpened = isOpened
    }
}


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private var sections = [Section]()
    
   @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

        
        sections = [
        
            Section(title: "Bikes", data: ["apache" ,"xblade", "xsr155"]),
            Section(title: "cars", data: ["fortuner" ,"mercedez", "ford", "tata nexon"]),
            Section(title: "Animals", data: ["cat" ,"mouse", "tiger", "lion"])
            
        ]
      
    }

    func numberOfSections(in tableView: UITableView) -> Int {
       
        return sections.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        let section = sections[section]
        
        if section.isOpened {
            return section.data.count + 1
        }else {
            return 1
        }
     
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if indexPath.row == 0 {
            cell.textLabel?.text = sections[indexPath.section].title
            cell.backgroundColor = .systemGreen
            cell.layer.borderWidth = 2
            cell.layer.borderColor = UIColor.systemBlue.cgColor
        } else {
            cell.textLabel?.text = sections[indexPath.section].data[indexPath.row - 1]
            cell.backgroundColor = .systemGray3
            cell.layer.borderWidth = 1
            cell.layer.borderColor = UIColor.systemGreen.cgColor
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row == 0 {
            
            sections[indexPath.section].isOpened = !sections[indexPath.section].isOpened
            tableView.reloadSections([indexPath.section], with: .none)
            
        } else {
            print("inner cell tapped")
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 80
        }else {
            return 60
        }
    }
}

