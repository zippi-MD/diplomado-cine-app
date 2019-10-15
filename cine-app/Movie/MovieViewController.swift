//
//  MovieViewController.swift
//  cine-app
//
//  Created by Alejandro Mendoza on 15/10/19.
//  Copyright © 2019 Alejandro Mendoza. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {

    @IBOutlet weak var selectTickets: UIView!
    @IBOutlet weak var movieGeneralDescription: UIView!
    @IBOutlet weak var moviePicture: UIImageView!
    @IBOutlet weak var movieDescription: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var childTicketQuantityLabel: UILabel!
    @IBOutlet weak var adultTicketQuantityLabel: UILabel!
    @IBOutlet weak var adultTicketPriceLabel: UILabel!
    @IBOutlet weak var kidTicketPriceLabel: UILabel!
    
    @IBOutlet weak var totalBackgroundView: UIView!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var totalButton: UIButton!
    
    
    var room: CinemaRoom?
    
    var selectedFunctionIndex: Int?
    
    var adultTickets: Int = 0 {
        willSet {
            adultTicketQuantityLabel.text = "\(newValue)"
        }
    }
    
    var kidsTickets: Int = 0 {
        willSet {
            childTicketQuantityLabel.text = "\(newValue)"
        }
    }
    
    var total: Double = 0.0 {
        willSet {
            totalLabel.text = "$\(newValue)"
            if newValue <= 0 {
                totalBackgroundView.isHidden = true
            }
            else {
                totalBackgroundView.isHidden = false
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        table.delegate = self
        
        setupUI()
        
    }
    
    func setupUI(){
        guard let room = room else { return }
        
        moviePicture.image = room.movie.picture
        movieDescription.text = room.movie.description
        movieTitle.text = room.movie.name
        
        table.separatorStyle = .none
        
        totalBackgroundView.layer.cornerRadius = 5.0
        totalButton.layer.cornerRadius = 5.0
        
        adultTicketPriceLabel.text = "$\(Constants.adultTicketPrice)"
        kidTicketPriceLabel.text = "$\(Constants.kidTicketPrice)"
        
    }
    
    func updateTotal(){
        total = Double(kidsTickets) * Constants.kidTicketPrice + Double(adultTickets) * Constants.adultTicketPrice
    }
    
    func sendAlertWithMessage(_ message: String){
        let alert = UIAlertController(title: "Ups...", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    @IBAction func onSegmentedControlChangedValue(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            movieGeneralDescription.isHidden = false
            selectTickets.isHidden = true
        case 1:
            movieGeneralDescription.isHidden = true
            selectTickets.isHidden = false
        default:
            return
        }
        
    }
    
    @IBAction func onAdultTicketQuantityChanged(_ sender: UIStepper) {
        adultTickets = Int(sender.value)
        updateTotal()
    }
    
    @IBAction func onKidsTicketQuantityChanged(_ sender: UIStepper) {
        kidsTickets = Int(sender.value)
        updateTotal()
    }
    
    @IBAction func addToCart(_ sender: UIButton) {
        guard let selectedFunction = selectedFunctionIndex else {
            sendAlertWithMessage("Por favor selecciona una función")
            return
        }
        
    }
    
}

extension MovieViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return room?.functions.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "FunctionsCell", for: indexPath)
        
        if let functions = room?.functions {
            cell.textLabel?.text = functions[indexPath.row]
        }
        
        if let index = selectedFunctionIndex, indexPath.row == index {
            cell.accessoryType = .checkmark
        }
        else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    
}

extension MovieViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedFunctionIndex = indexPath.row
        table.reloadData()
    }
}
