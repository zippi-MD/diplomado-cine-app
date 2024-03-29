//
//  ExampleData.swift
//  cine-app
//
//  Created by Alejandro Mendoza on 15/10/19.
//  Copyright © 2019 Alejandro Mendoza. All rights reserved.
//

import UIKit

let ironManMovie = Movie(name: "Iron Man", description: "Un empresario millonario construye un traje blindado y lo usa para combatir el crimen y el terrorismo.", director: "Jon Favreau", picture: UIImage(named: "IronMan")!)

let avengersMovie = Movie(name: "Avengers", description: "Los superhéroes se alían para vencer al poderoso Thanos, el peor enemigo al que se han enfrentado.", director: "Anthony Russo", picture: UIImage(named: "Avengers")!)

let isleOfDogsMovie = Movie(name: "Isle of Dogs", description: "El alcalde de una ciudad japonesa decreta que, con motivo de una epidemia de gripe canina, todos los perros deben ser confinados a una isla.", director: "Wes Anderson", picture: UIImage(named: "IsleOfDogs")!)


let room1 = CinemaRoom(movie: ironManMovie, seats: 10, roomNumber: 1, functions: ["11:00", "15:00", "20:00", "00:00"])

let room2 = CinemaRoom(movie: avengersMovie, seats: 55, roomNumber: 2, functions: ["09:00", "12:00", "15:00", "18:00", "22:00", "00:00"])

let room3 = CinemaRoom(movie: isleOfDogsMovie, seats: 80, roomNumber: 3, functions: ["19:00", "22:00"])


var cinemaRooms = [room1, room2, room3]


var kitkat = Candy(name: "Kit Kat", image: UIImage(named: "kitkat")!, price: 20.0, quantity: 0)
var panditas = Candy(name: "Panditas", image: UIImage(named: "panditas")!, price: 35.0, quantity: 0)
var icee = Candy(name: "Icee", image: UIImage(named: "icee")!, price: 40.0, quantity: 0)
var skittles = Candy(name: "Skittles", image: UIImage(named: "skittles")!, price: 17.0, quantity: 0)

var candies = [kitkat, panditas, icee, skittles]

var cartTickets: [Ticket] = []
