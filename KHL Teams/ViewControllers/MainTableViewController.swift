//
//  MainTableViewController.swift
//  KHL Teams
//
//  Created by Дмитрий Селезнев on 21.09.2020.
//  Copyright © 2020 Дмитрий Селезнев. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    private let jsonURL = "https://khl.api.webcaster.pro/api/khl_mobile/teams_v2.json"
    private var teams: [Team] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationBar(largeTitelColor: UIColor.white,
                               backgroundColor: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1),
                               tintColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),
                               title: "Команды КХЛ",
                               prefferedLargeTitle: true)
        
        if teams.isEmpty == true {
            tableView.separatorStyle = .none
        }
        
        getTeams()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return teams.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "teamCell", for: indexPath) as! TeamTableViewCell
        
        cell.configureCell(with: teams[indexPath.row])
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    private func getTeams() {
        NetworkManager.shared.fetchData { (teams) in
            self.teams = teams
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.tableView.separatorStyle = .singleLine
            }
        }
    }
    //    func fetchData() {
    //        guard let url = URL(string: jsonURL) else { return }
    //
    //        URLSession.shared.dataTask(with: url) { (data, response, error) in
    //
    //            guard let data = data else { return }
    //            if let error = error {
    //                print(error.localizedDescription)
    //                return
    //            }
    //
    //            if let response = response {
    //                print(response)
    //            }
    //
    //            do {
    //                self.teams = try JSONDecoder().decode([Team].self, from: data)
    //                DispatchQueue.main.async {
    //                    self.tableView.reloadData()
    //                    self.tableView.separatorStyle = .singleLine
    //                }
    //            } catch let error {
    //                print(error)
    //            }
    //        } .resume()
    //    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            let vc = segue.destination as! DetailsViewController
            vc.team = teams[indexPath.row]
        }
        
        
        
    }
}


extension UITableViewController{
    func configureNavigationBar(largeTitelColor: UIColor,
                                backgroundColor: UIColor,
                                tintColor: UIColor,
                                title: String,
                                prefferedLargeTitle: Bool) {
        if #available(iOS 13.0, *) {
            let navigationBarAppearance = UINavigationBarAppearance()
            
            navigationBarAppearance.configureWithOpaqueBackground()
            navigationBarAppearance.largeTitleTextAttributes = [.foregroundColor: largeTitelColor]
            navigationBarAppearance.titleTextAttributes = [.foregroundColor: largeTitelColor]
            navigationBarAppearance.backgroundColor = backgroundColor
            
            navigationController?.navigationBar.standardAppearance = navigationBarAppearance
            navigationController?.navigationBar.compactAppearance = navigationBarAppearance
            navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
            
            navigationController?.navigationBar.prefersLargeTitles = prefferedLargeTitle
            navigationController?.navigationBar.isTranslucent = false
            navigationController?.navigationBar.tintColor = tintColor
            navigationController?.navigationBar.superview?.backgroundColor = .white
            navigationItem.title = title
            
        } else {
            // fallback on earlier virsion
            navigationController?.navigationBar.prefersLargeTitles = prefferedLargeTitle
            navigationController?.navigationBar.isTranslucent = false
            navigationController?.navigationBar.tintColor = tintColor
            navigationItem.title = title
            navigationController?.view.backgroundColor = backgroundColor
        }
        
    }
}

