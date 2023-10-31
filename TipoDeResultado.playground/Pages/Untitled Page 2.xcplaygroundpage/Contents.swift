//: [Previous](@previous)

import Foundation

enum ErrorSuma:Error {
    case arrayVacio, datoInvalido
}

let array1 = [5,6,7,7,4,3,3,4]
let array2 = [-5,6,7,7,-4,3,3,4]

func SumaNumero(nums: [Int]) throws -> Int {
    if nums.isEmpty {
        throw ErrorSuma.arrayVacio
    }
    
    if !(nums.allSatisfy { $0 >= 0 }){
        throw ErrorSuma.datoInvalido
    }
    
    return nums.reduce(0,+)
}

do {
    let suma1 = try SumaNumero(nums: array1)
    let suma2 = try SumaNumero(nums: array2)
    let suma3 = try SumaNumero(nums: [])
    
} catch ErrorSuma.arrayVacio {
    print("Arrat Vacio")
} catch ErrorSuma.datoInvalido {
    print("Array Data Invalido")
} catch {
    print("\(error)")
}
