func countWithRemovedDuplicates(_ numbers: inout [Int]) -> Int {
    var previousValue: Int?
    var count: Int = 0

    for value in numbers {
        if value != previousValue {
            numbers[count] = value

            previousValue = value
            count += 1
        }
    }
    return count
}

var nums = [0,0,0,1,1,2,3,3,4,4,4]
countWithRemovedDuplicates(&nums)
print(nums)
