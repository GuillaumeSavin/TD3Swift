//
//  main.swift
//  TD3
//
//  Created by Guillaume Savin on 21/09/2020.
//  Copyright © 2020 Guillaume Savin. All rights reserved.
//

import Foundation

print("Hello, World!")

let a : Fraction = Fraction(3, 4)
print(a)
let b = Fraction(7)
print(b)
var c = Fraction()
print(c)
c = a + b
print(c)
c = a / b
print(c)
let d = -a
print(d)
c += b
print("+= \(c)")
c *= a
print("c = \(c)")
var tmp = a^(5)
print(tmp)
tmp = a^(-5)
print(tmp)
var test = a > b
print(test)
test = a < b
print(test)
var test2 = min(a, b)
print(test2)
var test3 = Double(c)
print(test3)
c = Fraction(3.25)
print(c)




