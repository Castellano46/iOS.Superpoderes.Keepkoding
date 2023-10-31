import Cocoa

enum ErrorSuma {
    case arrayVacio, datoInvalido
}

let array1 = [5,6,7,7,4,3,3,4]
let array2 = [-5,6,7,7,-4,3,3,4]

func SumaNumero(nums: [Int]) -> Int? {
    if nums.isEmpty {
        return nil
    }
    
    if !(nums.allSatisfy { $0 >= 0 }){
        return nil // Si alguno es menor de cero
    }
    return nums.reduce(0,+)
}


SumaNumero(nums: array1)
SumaNumero(nums: array2)
SumaNumero(nums: [])


