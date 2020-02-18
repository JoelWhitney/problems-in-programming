import Foundation

let maxTermValue = 4000000

func sumOfEvens(_ maxTermValue: Int) -> Int {
    var sum = 0
    findEvenFibonacciTerms(maxTermValue).forEach { term in
        sum += term
    }
    return sum
}

func findEvenFibonacciTerms(_ maxTermValue: Int) -> [Int] {
    var fibonaccis = [1, 2]

    while (fibonaccis.last!) < maxTermValue {
        let lastTwoTerms = fibonaccis[(fibonaccis.count - 2)...]
        let sumOfLastTwoTerms = lastTwoTerms.first! + lastTwoTerms.last!
        if sumOfLastTwoTerms <= maxTermValue {
            fibonaccis.append(sumOfLastTwoTerms)
        } else {
            break
        }
    }
    return fibonaccis.filter { $0 % 2 == 0 }
}

sumOfEvens(maxTermValue)
