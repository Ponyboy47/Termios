//
//  main.swift
//  Termios
//
//  Created by Neil Pankey on 3/20/15.
//  Copyright (c) 2015 Neil Pankey. All rights reserved.
//

import Termios
import Darwin.C.stdio

println("Hello, World!")

let raw = Termios()

let c = getchar()
println("\(c)\r")
print("at start?")

getchar()