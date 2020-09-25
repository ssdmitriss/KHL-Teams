//
//  ViewController.swift
//  KHL Teams
//
//  Created by Дмитрий Селезнев on 21.09.2020.
//  Copyright © 2020 Дмитрий Селезнев. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    
    @IBOutlet weak var nameTeam: UILabel!
    @IBOutlet weak var logoTeam: ImageView!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var conference: UILabel!
    
    var team: Team!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTeam.text = team.team?.name
        city.text = team.team?.location
        conference.text = team.team?.conference
        logoTeam.fetchImage(with: self.team.team?.image)
//        DispatchQueue.global().async {
//            guard let imageString = self.team.team?.image else { return }
//            guard let imageURL = URL(string: imageString) else { return }
//            self.
//
//            DispatchQueue.main.async {
//                self.logoTeam.image = UIImage(data: imageData)
//            }
        
        
        // Do any additional setup after loading the view.
    

    }
}

