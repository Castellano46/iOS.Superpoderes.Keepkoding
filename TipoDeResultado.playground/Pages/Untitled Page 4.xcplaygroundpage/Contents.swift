//: [Previous](@previous)

import Foundation

enum ErrorSuma: Error {
    case arrayVacio, datoInvalido
}

func SumaNumeros(nums: [Int]) -> Result<Int, ErrorSuma> {
    if nums.isEmpty {
        return .failure(.arrayVacio)
    }
    
    if !(nums.allSatisfy { $0 >= 0 }){
        return .failure(.datoInvalido)
    }
    
    return .success(nums.reduce(0,+))
}

let suma = SumaNumeros(nums: [1,2,3,4,5])

switch suma {
    case .success(let num) : print("Resultado ok: \(num)")
    case .failure(let mensaje) : print("Error: \(mensaje)")
}
