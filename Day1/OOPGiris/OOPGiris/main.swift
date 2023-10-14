//
//  main.swift
//  OOPGiris
//
//  Created by Yakup on 14.10.2023.
//

import Foundation

// MARK: Inheritance, Encapsulation, Abstraction, Polymorphism

var musician = Musician(name: "Yakup Açış", age: 23, instrument: "Guitar", musicianType: .Baterist)

print(musician.instrument)
print(musician.function())

musician.sum(x: 2, y: 3)
musician.sum(x: 2, y: 3, z: 4)

var superMusician = SuperMusician(name: "Super Yakup", age: 35, instrument: "Bateri", musicianType: .Baterist)

superMusician.superFunction()
superMusician.function()
