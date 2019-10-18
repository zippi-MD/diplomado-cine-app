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
    
    var selectedRoom: CinemaRoom?
    var selectedRoomIndex: Int = 0
    var cart: [Ticket] = [] {
        willSet {
            cartTickets = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        table.delegate = self
        
        table.allowsSelection = false
        
        navigationItem.rightBarButtonItem = nil
        // Do any additional setup after loading the view.
    }
    
    func updateCartIcon(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "cart"), landscapeImagePhone: UIImage(systemName: "cart"), style: .plain, target: self, action: #selector(test))
    }
    
    @objc func test(){
        performSegue(withIdentifier: "goToCart", sender: nil)
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMovie" {
            let destination = segue.destination as! MovieViewController
            destination.room = selectedRoom!
            destination.moviesVC = self
            destination.selectedRoomIndex = selectedRoomIndex
        }
    }
    
    

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
        movieCell.roomIndex = indexPath.row
        
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
    func wasSelectedWithRoom(_ room: CinemaRoom, index: Int) {
        selectedRoom = room
        selectedRoomIndex = index
        performSegue(withIdentifier: "showMovie", sender: nil)
    }
    
    
}
