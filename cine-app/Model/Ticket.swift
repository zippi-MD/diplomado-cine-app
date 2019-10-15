//
//  Ticket.swift
//  cine-app
//
//  Created by Alejandro Mendoza on 15/10/19.
//  Copyright © 2019 Alejandro Mendoza. All rights reserved.
//

import Foundation

struct Ticket {
    let seats: [(Int, Seat)]
    let function: String
    let total: Double
}
