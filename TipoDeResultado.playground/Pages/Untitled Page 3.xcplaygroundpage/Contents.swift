//: [Previous](@previous)

import Foundation

enum Resultado<Int,String> {
    case ok(Int)
    case error(String)
}

func SumaNumeros2(nums: [Int]) -> Resultado<Int,String> {
    if nums.isEmpty {
        return .error("Array vacio")
    }
    if !(nums.allSatisfy { $0 >= 0 }){
        return .error("Dato no valido")
    }
    
    return .ok(nums.reduce(0,+))
}

let resultado = SumaNumeros2(nums: [1,2,3,45,6])

switch resultado {
    case .ok(let num) : print("Resultado ok: \(num)")
case .error(let mensaje) : print("Error: \(mensaje)")
}
