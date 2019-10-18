//
//  CartViewController.swift
//  cine-app
//
//  Created by Alejandro Mendoza on 17/10/19.
//  Copyright © 2019 Alejandro Mendoza. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {

    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var totalLabel: UILabel!
    
    var total: Double = 0.0 {
        willSet {
            totalLabel.text = "Total: \(newValue)"
        }
    }
    
    var nonEmptyCandies: [Candy] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for candy in candies {
            if candy.quantity > 0 {
                nonEmptyCandies.append(candy)
            }
        }
        
        calculateTotal()
        
        table.dataSource = self
        table.delegate = self
        
        table.allowsSelection = false
        

    }
    
    func getNumberOfSeatsForTicketsIn(_ ticket: Ticket, seatType: Seat) -> Int {
        var numberOfSeats: Int = 0
        
        for seat in ticket.seats {
            if seat.1 == seatType {
                numberOfSeats += seat.0
            }
        }
        
        return numberOfSeats
    }
    
    func calculateTotal(){
        
        for ticket in cartTickets {
            total += ticket.total
        }
        
        for candy in nonEmptyCandies {
            total += candy.price * Double(candy.quantity)
        }
        
        totalLabel.text = "Total:  \(total)"
    }

}


extension CartViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return cartTickets.count
        case 1:
            return nonEmptyCandies.count
        default:
            return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        switch indexPath.section {
        case 0:
            let ticketCell = table.dequeueReusableCell(withIdentifier: "TicketResumeCell", for: indexPath) as! TicketResumeTableViewCell
            
            let ticket = cartTickets[indexPath.row]
            
            ticketCell.movieNameLabel.text = "\(ticket.movie.name) - \(ticket.function)"
            ticketCell.adultTicketsLabel.text = "\(getNumberOfSeatsForTicketsIn(ticket, seatType: .adult)) - Adultos"
            ticketCell.kidsTicketsLabel.text = "\(getNumberOfSeatsForTicketsIn(ticket, seatType: .kid)) - Niños"
            ticketCell.totalLabel.text = "$ \(ticket.total)"
            
            cell = ticketCell
        case 1:
            let candyCell = table.dequeueReusableCell(withIdentifier: "CandyResumeCell", for: indexPath) as! CandyResumeTableViewCell
            let candy = nonEmptyCandies[indexPath.row]
            candyCell.candyNameLabel.text = candy.name
            candyCell.candyQuantityLabel.text = "Cantidad: \(candy.quantity)"
            candyCell.totalLabel.text = "$ \(Double(candy.quantity) * candy.price)"
            cell = candyCell
            
        default:
            print("Something Wrong")
            
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 140
        case 1:
            return 125
        default:
            return 300
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            if !cartTickets.isEmpty {
                return "Boletos"
            }
            
        case 1:
            if !nonEmptyCandies.isEmpty {
                return "Dulces"
            }
            
        default:
            return "Error"
        }
        
        return nil
    }
    
    
}

extension CartViewController: UITableViewDelegate {
    
}
