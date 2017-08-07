//
//  ViewController.swift
//  ExpandingCollapsingTest
//
//  Created by Kareem Mohammed on 7/30/17.
//  Copyright © 2017 kareem. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ExpandingHeaderViewDelegate {


    @IBOutlet weak var tableview: UITableView!
    
    var sections = [
        Section(genre: "genre 1", movies: ["movie1 1", "movie1 2"], expanded: false, subtitle: "select a movie"),
        Section(genre: "genre 2", movies: ["movie2 1", "movie2 2"], expanded: false, subtitle: "select a movie"),
        Section(genre: "genre 3", movies: ["movie3 1", "movie3 2"], expanded: false, subtitle: "select a movie"),
        Section(genre: "genre 4", movies: ["movie4 1", "movie4 2"], expanded: false, subtitle: "select a movie"),
        Section(genre: "genre 5", movies: ["movie5 1", "movie5 2"], expanded: false, subtitle: "select a movie"),
        Section(genre: "genre 6", movies: ["movie6 1", "movie6 2"], expanded: false, subtitle: "select a movie"),
        Section(genre: "genre 7", movies: ["movie7 1", "movie7 2"], expanded: false, subtitle: "select a movie"),
        Section(genre: "genre 8", movies: ["movie8 1", "movie8 2"], expanded: false, subtitle: "select a movie")
    ]
    
    var selectedIndexPath: IndexPath!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        selectedIndexPath = IndexPath(row: -1, section: -1)
        
        let nibFile = UINib(nibName: "ExpandingHeaderView", bundle: nil)
        tableview.register(nibFile, forHeaderFooterViewReuseIdentifier: "ExpandingHeaderView")
    }

    
    //MARK:- TableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].movies.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 58
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if sections[indexPath.section].expanded {
            return 44
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableview.dequeueReusableHeaderFooterView(withIdentifier: "ExpandingHeaderView") as! ExpandingHeaderView
        headerView.customInit(title: sections[section].genre, subtitle: sections[section].subtitle, section: section, delegate: self)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = sections[indexPath.section].movies[indexPath.row]
        cell?.accessoryType = (selectedIndexPath == indexPath) ? .checkmark:.none
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndexPath = indexPath
        self.sections[indexPath.section].subtitle =  tableview.cellForRow(at: indexPath)?.textLabel?.text
        sections[indexPath.section].expanded = !sections[indexPath.section].expanded

        tableview.beginUpdates()
        tableview.reloadSections([indexPath.section], with: .automatic)
        tableview.endUpdates()
    }
    
    //MARK:- ExpandingHeaderViewDelegate
    func toogleSection(header: ExpandingHeaderView, section: Int) {
        sections[section].expanded = !sections[section].expanded
        tableview.beginUpdates()
        tableview.reloadSections([section], with: .automatic)
        tableview.endUpdates()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

