//
//  main.swift
//  Structs
//
//  Created by Yakup on 21.10.2023.
//

import Foundation

let musicianClass = MusicianClass(name: "Atıl", age: 60, instrument: "Gitar")
var musicianStruct = MusicianStruct(name: "Yakup", age: 23, instrument: "Keman")

let musicianClassCopy = musicianClass
var musicianStructCopy = musicianStruct

musicianClass.age += 1
musicianStruct.age += 1

print(musicianClassCopy.age)
print(musicianStructCopy.age)

// tuple

let myTuple = (1, 3, 5)
print(myTuple.0)

var mutableTuple = (1, 3, 5)
mutableTuple.0 = 100
print(mutableTuple.0)

let nameTuple = (name: "Yakup", age: 23)
print(nameTuple.name)

let myTuple2: (String, String)
myTuple2.0 = "Yakup"
myTuple2.1 = "Açış"
print(myTuple2.0)

// guard let

func convertToInt(num: String) -> Int{
	if let myInt = Int(num){
		return myInt
	}else{
		return 0
	}
}

func convertToIntGuardLet(num: String) -> Int{
	guard let myInt = Int(num) else { return 0 }
	return myInt
}

print(convertToIntGuardLet(num: "32"))
print(convertToInt(num: "32"))

// closure

func sum(x: Int, y: Int) -> Int{
	return x + y
}

func calculate(x: Int, y: Int, myFunc: (Int, Int) -> Int) -> Int{
	return myFunc(x, y)
}

print(calculate(x: 5, y: 15, myFunc: sum))

var resultSum = calculate(x: 10, y: 23) { x, y in
	return x + y
}
print(resultSum)
print(calculate(x: 99, y: 99, myFunc: { $0 + $1 }))



let myNumberArray = [10, 20, 30, 40, 50, 60, 70, 80, 90]

func highOrderFunction(num: Int) -> Int {
	return num * 10
}

print(myNumberArray.map(highOrderFunction(num:)))
print(myNumberArray.map({$0 * 100}))
