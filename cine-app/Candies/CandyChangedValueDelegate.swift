//
//  candyChangedValueDelegate.swift
//  cine-app
//
//  Created by Alejandro Mendoza on 17/10/19.
//  Copyright © 2019 Alejandro Mendoza. All rights reserved.
//

import Foundation

protocol CandyChangedValueDelegate {
    func candyChangedQuantityTo(_ quantity: Int, index: Int)
}
