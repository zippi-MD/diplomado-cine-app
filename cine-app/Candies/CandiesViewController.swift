//
//  CandiesViewController.swift
//  cine-app
//
//  Created by Alejandro Mendoza on 17/10/19.
//  Copyright © 2019 Alejandro Mendoza. All rights reserved.
//

import UIKit

class CandiesViewController: UIViewController {

    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        table.delegate = self
        table.dataSource = self
        
        table.allowsSelection = false
        
        
    }
    
    func setBarCartIconTo(_ state: Bool){
        
        if state {
            let barButton = UIBarButtonItem(image: UIImage(systemName: "cart"), landscapeImagePhone: UIImage(systemName: "cart"), style: .plain, target: self, action: #selector(test))
            navigationItem.rightBarButtonItem = barButton
        }
        else {
            navigationItem.rightBarButtonItem = nil
        }
        
    }
    
    @objc func test(){
        performSegue(withIdentifier: "goToCart", sender: nil)
    }
    

}

extension CandiesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return candies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "CandyCell", for: indexPath) as! CandyTableViewCell
        
        let candy = candies[indexPath.row]
        
        cell.candyName.text = candy.name
        cell.candyPriceLabel.text = "$\(candy.price)"
        cell.candyImageView.image = candy.image
        cell.candies = candy.quantity
        
        cell.candyIndex = indexPath.row
        
        cell.delegate = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    
}


extension CandiesViewController: UITableViewDelegate {
    
}

extension CandiesViewController: CandyChangedValueDelegate {
    func candyChangedQuantityTo(_ quantity: Int, index: Int) {
        
        candies[index].quantity = quantity
        
        for candy in candies {
            if candy.quantity > 0 {
                setBarCartIconTo(true)
                return
            }
        }
        
        setBarCartIconTo(false)
        
    }
    
    
}
