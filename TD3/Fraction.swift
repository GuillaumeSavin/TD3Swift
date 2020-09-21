//
//  Fraction.swift
//  TD3
//
//  Created by Guillaume Savin on 21/09/2020.
//  Copyright © 2020 Guillaume Savin. All rights reserved.
//

import Foundation

typealias fra = (Int, Int)

struct Fraction {
    let numérateur : Int
    let dénominateur : Int
    
    init(_ num: Int, _ dén: Int)
    {
        var temp = fra(num, dén)
        
        temp = reduit(num, dén)
        if temp.1 < 0 {
            self.numérateur = -temp.0
            self.dénominateur = -temp.1
        }
        else {
            self.numérateur = temp.0
            self.dénominateur = temp.1
        }
    }
    init() {
        self.numérateur = 0
        self.dénominateur = 1
    }
    init(_ num: Int) {
        self.numérateur = num
        self.dénominateur = 1
    }
}

extension Fraction : Equatable {
    static func == (left: Fraction, right: Fraction) -> Bool {
        return left.dénominateur == right.dénominateur && left.numérateur == right.dénominateur
    }
    static func + (left: Fraction, right: Fraction) -> Fraction {
        return som(fraction: left, fraction2: right)
    }
    static func - (left: Fraction, right: Fraction) -> Fraction {
        return sub(fraction: left, fraction2: right)
    }
    static func / (left: Fraction, right: Fraction) -> Fraction {
        return div(fraction: left, fraction2: right)
    }
    static func * (left: Fraction, right: Fraction) -> Fraction {
        return prod(fraction: fra(left.numérateur, left.dénominateur), fraction2: fra(right.numérateur, right.dénominateur))
    }
    
}

func neg(fraction: fra) -> fra {
    var fraNeg = fraction
    var numerator = -fraNeg.0
    fraNeg.0 = numerator
    
    return fraNeg
}
func PGCD(int: Int, int2: Int) -> Int {
    var reste = -1
    var num = int
    var quot = int2
    
    while(reste != 0)
    {
        reste = num % quot
        //print("\(num) = \(quot) x \(num / quot) + \(reste)")
        if (reste != 0 ) {
            num = quot
            quot = reste
        }
        
    
    }
    
    return quot
}
func reduit(_ numérateur : Int, _ dénominateur: Int) -> (Int, Int) {
    var num = numérateur
    var quot = dénominateur
    var pgcd = 0
    
    pgcd = PGCD(int: num, int2: quot)
    
    if pgcd != 1 {
        num = num / pgcd
        quot = quot / pgcd
    }
    
    return (num, quot)
}
func som(fraction: Fraction, fraction2: Fraction) -> Fraction {
    var denominator = 0
    var numerator = 0
    if (fraction.dénominateur == fraction2.dénominateur) {
        denominator = fraction.dénominateur
        numerator = fraction.numérateur + fraction2.numérateur
    }
    else {
        denominator = fraction.dénominateur * fraction2.dénominateur
        numerator = fraction.numérateur * fraction2.dénominateur + fraction2.numérateur * fraction.dénominateur
    }
    
    let temp = reduit(numerator, denominator)
    
    return Fraction(temp.0, temp.1)
}
func sub(fraction: Fraction, fraction2: Fraction) -> Fraction {
    var temp = fra(neg(fraction: (fraction2.numérateur, fraction2.dénominateur)))
    return som(fraction: fraction, fraction2: Fraction(temp.0, temp.1))
}
func prod(fraction: fra, fraction2: fra) -> Fraction {
    var fraProd = Fraction(0,0)
    var numerator = fraction.0 * fraction2.0
    var denominator = fraction.1 * fraction2.1
    
    fraProd = Fraction(numerator, denominator)
    
    return fraProd
}
func inv(_ fraction: fra) -> Fraction {
    var numerator = fraction.1
    var denominator = fraction.0
    
    var fraInv = Fraction(numerator, denominator)
    
    return fraInv
}
func div(fraction: Fraction, fraction2: Fraction) -> Fraction {
    var temp = fra(fraction.numérateur, fraction.dénominateur)
    var temp2 = inv(fra(fraction2.numérateur, fraction2.dénominateur))
    var temp3 = fra(temp2.numérateur, temp2.dénominateur)
    var res = prod(fraction: temp, fraction2: temp3)
    return res
}
