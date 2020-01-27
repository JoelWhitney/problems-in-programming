
import time

def main():
    times = ["03:15", "11:59", "12:01", "6:30", "3:45", "12:30"]
    for timeString in times:
        print( "Time: {}, Degrees: {}".format(timeString, degreesBetweenHands(timeString)))

def degreesBetweenHands(timeString):
    t = time.strptime(timeString, "%I:%M")
    hour, minute = t[3], t[4]
    hourPercentage = minute / 60.0
    hourMinutes = (hour + hourPercentage) * 5.0
    minutesDifference = minute - hourMinutes
    return abs(minutesDifference * 6.0)

main()
