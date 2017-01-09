//
//  ViewController.swift
//  PartyRockApp
//
//  Created by Sandra Rezk on 12/27/16.
//  Copyright © 2016 Sandra Rezk. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var partyRocks = [PartyRock]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let p1 = PartyRock(imageURL: "https://i.ytimg.com/vi/UQ92eyxnxmQ/hqdefault.jpg?custom=true&w=196&h=110&stc=true&jpg444=true&jpgq=90&sp=68&sigh=PG0vTQ4ANXUMnsuHGZ5lesUOm24", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/UQ92eyxnxmQ\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "It's Not Over")
        
        let p2 = PartyRock(imageURL: "https://i.ytimg.com/vi/B1CPJ20lP5w/hqdefault.jpg?custom=true&w=196&h=110&stc=true&jpg444=true&jpgq=90&sp=68&sigh=f8ShK9f5mxFTPWJPt_-qfx8vxS4", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/B1CPJ20lP5w\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Torches")
        
        let p3 = PartyRock(imageURL: "https://i.ytimg.com/vi/nJzBcKM3ZIE/hqdefault.jpg?custom=true&w=196&h=110&stc=true&jpg444=true&jpgq=90&sp=68&sigh=9AgeF9ZQtPAiNgmUP-50RBvryXY", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/nJzBcKM3ZIE\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "September")
        
        let p4 = PartyRock(imageURL: "https://i.ytimg.com/vi/m02-RHN_hQE/hqdefault.jpg?custom=true&w=196&h=110&stc=true&jpg444=true&jpgq=90&sp=68&sigh=z0A5lB5BjzEnC1W42Vg-vuaQSPw", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/nJzBcKM3ZIE\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Over You")
        
        let p5 = PartyRock(imageURL: "https://i.ytimg.com/vi/SXjXKT98esw/hqdefault.jpg?custom=true&w=196&h=110&stc=true&jpg444=true&jpgq=90&sp=68&sigh=-Iarwl7U7kxuQ0FpIuMDbrDgIZc", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/SXjXKT98esw\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Waiting for Superman")
        
        
        partyRocks.append(p1)
        partyRocks.append(p2)
        partyRocks.append(p3)
        partyRocks.append(p4)
        partyRocks.append(p5)

        
        tableView.delegate = self
        tableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyCell {
            
            let partyRock = partyRocks[indexPath.row]
            
            cell.updateUI(partyRock: partyRock)
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRocks.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let partyRock = partyRocks[indexPath.row]
        
        performSegue(withIdentifier: "VideoVC", sender: partyRock)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? VideoVC{
            if let party = sender as? PartyRock{
                destination.partyRock = party
            }
        }
    }


}

