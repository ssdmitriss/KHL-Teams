//
//  TeamTableViewCell.swift
//  KHL Teams
//
//  Created by Дмитрий Селезнев on 21.09.2020.
//  Copyright © 2020 Дмитрий Селезнев. All rights reserved.
//

import UIKit

class TeamTableViewCell: UITableViewCell {
    
    @IBOutlet weak var teamLogo: ImageView!
    @IBOutlet weak var nameTeam: UILabel!
    @IBOutlet weak var cityTeam: UILabel!
    @IBOutlet weak var divisionTeam: UILabel!
    
    func configureCell(with team: Team) {
        nameTeam.text = team.team?.name
        cityTeam.text = team.team?.location
        divisionTeam.text = team.team?.division
        teamLogo.fetchImage(with: team.team?.image)
        
        // если не используем кэширование
        
//        DispatchQueue.global().async {
//            guard let imageString = team.team?.image else { return }
//            guard let imageURL = URL(string: imageString) else { return }
//            guard let imageData = try? Data(contentsOf: imageURL) else { return }
//
//            DispatchQueue.main.async {
//                self.teamLogo.image = UIImage(data: imageData)
//            }
//        }
//    }
    
    }
}
