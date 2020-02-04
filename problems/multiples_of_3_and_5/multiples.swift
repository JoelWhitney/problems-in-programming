import Foundation

let belowNumber = 1000

func sumOfMultiples(_ belowNumber: Int) -> Int {
    var sum = 0
    find3And5Multiples(belowNumber).forEach { multiple in
        sum += multiple
    }
    return sum
}

func find3And5Multiples(_ belowNumber: Int) -> [Int] {
    var multiples = [Int]()
    for i in (1...belowNumber - 1) {
        if (i % 3 == 0) || (i % 5 == 0) { multiples.append(i) }
    }
    return multiples
}

sumOfMultiples(belowNumber)
