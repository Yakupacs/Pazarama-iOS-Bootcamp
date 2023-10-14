//
//  Roman.swift
//  RomanToIntegerApp
//
//  Created by Eken Özlü, Yakup Açış, Beyza Zehra Olgunsoy, Ahmet Yasin Atakan, Şahin Yürek on 14.10.2023.
//

import Foundation

enum MyError: Error {
    case runtimeError(String)
}

class RomanConversion{
    
    func convert(_ romenNumberTyped: String) throws -> Int{
        var result = 0
        var previousResult = 0
        var count = 1
        
        let romenNumbers : [Character : Int] = ["I" : 1, "V" : 5, "X" : 10, "L" : 50, "C" : 100, "D" : 500, "M" : 1000]
        
        if romenNumberTyped.count == 0  {
            throw MyError.runtimeError("Roman should be greater than 0")
        }
        
        if romenNumberTyped.contains("LL") || romenNumberTyped.contains("VV") || romenNumberTyped.contains("DD") {
            throw MyError.runtimeError("Invalid Roman Number decleration")
        }
        
        for i in romenNumberTyped.reversed(){
            if let value = romenNumbers[i] {
                if value == previousResult {
                    count += 1
                    if count > 3 {
                        throw MyError.runtimeError("Invalid Roman Number decleration")
                    }
                } else {
                    count = 1
                }
                if value < previousResult{
                    result -= value
                }
                else {
                    result += value
                }
                previousResult = value
            } else{
                throw MyError.runtimeError("Invalid Roman Number decleration")
            }
            
        }
        return result
    }
    
}
