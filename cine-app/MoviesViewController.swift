//
//  MoviesViewController.swift
//  cine-app
//
//  Created by Alejandro Mendoza on 15/10/19.
//  Copyright © 2019 Alejandro Mendoza. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController {

    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        table.delegate = self
        // Do any additional setup after loading the view.
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

extension MoviesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cinemaRooms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath)
        
        let room = cinemaRooms[indexPath.row]
        let movie = room.movie
        
        guard let movieCell = cell as? MovieTableViewCell else { return cell }
        
        movieCell.movieTitle.text = movie.name
        movieCell.movieImage.image = movie.picture
        movieCell.movieDescription.text = movie.description
        
        movieCell.room = room
        movieCell.delegate = self
        
        movieCell.viewFunctions.layer.cornerRadius = 5.0
        
        return movieCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 297
    }
    
    
}

extension MoviesViewController: UITableViewDelegate {
    
}


extension MoviesViewController: roomSelectedDelegate {
    func wasSelectedWithRoom(_ room: CinemaRoom) {
        print(room)
    }
    
    
}
