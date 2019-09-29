func generateArrayWithMissingNumber(totalNumbers: Int, shuffle: Bool) -> [Int] {
    var numbers = [Int]()
    for number in 1...totalNumbers {
        numbers.append(number)
    }
    let randomIndex = Int.random(in: 0...totalNumbers - 1)
    numbers.remove(at: randomIndex)
    return (shuffle) ? numbers.shuffled() : numbers
}

func findMissingInteger(inArray: [Int]) -> Int? {
    for number in 1...inArray.count + 1 {
        if inArray.firstIndex(of: number) == nil {
            return number
        }
    }
    return nil
}

let numbers = generateArrayWithMissingNumber(totalNumbers: 100, shuffle: false)
if let missingNumber = findMissingInteger(inArray: numbers) {
    print("Missing number is \(missingNumber)")
} else {
    print("No missing numbers")
}
