import Foundation

let times = ["03:15", "11:59", "12:01", "6:30", "3:45", "12:30"]


func degreesBetweenHands(forTime: String) -> Double? {
    let formatter = DateFormatter()
    formatter.dateFormat = "hh:mm"
    let timeDate = Calendar.current.dateComponents([.hour, .minute], from:formatter.date(from: forTime)!)

    guard let hour = timeDate.hour, let minute = timeDate.minute else { return nil }
    let hourPercentage = Double(minute) / 60.0
    let hourMinutes = (Double(hour) + hourPercentage) * 5.0
    let minutesDifference = Double(minute) - hourMinutes
    return abs(minutesDifference * 6.0)
}

for time in times {
    if let degrees = degreesBetweenHands(forTime: time) {
        print("Time: \(time), Degrees: \(degrees)")
    } else {
        print("Error getting degrees for time: \(time)")
    }
}
