//
//  Player.swift
//  ChicagoWhiteSox
//
//  Created by Naga Praveen Kumar Pendyala on 11/3/15.
//  Copyright (c) 2015 Naga Praveen Kumar Pendyala. All rights reserved.
//

import Foundation

class Player{
    
    var number: String
    var fname: String
    var lname: String
    var position: String
    var bats: String
    var throws: String
    var height: String
    var weight: String
    var dob: String
    
    // default initializer
    
    init(number: String, fname: String, lname: String, position: String, bats: String, throws: String,
        height: String, weight: String, dob: String ){
            
            self.number = number
            self.fname = fname
            self.lname = lname
            self.position = position
            self.bats =  bats
            self.throws = throws
            self.height = height
            self.weight = weight
            self.dob = dob
    }
    
}

