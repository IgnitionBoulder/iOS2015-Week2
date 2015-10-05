//: # Classes
//: [TOC](Table%20of%20Contents) | [Previous](@previous) | Next

import Foundation
import UIKit

//: ## Classes
//: Classes are like structs, but with a few differences:
//: * Inheritance enables one class to inherit the characteristics of another.
//: * Type casting enables you to check and interpret the type of a class instance at runtime.
//: * Deinitializers enable an instance of a class to free up any resources it has assigned.
//: * Reference counting allows more than one reference to a class instance.

class Vehicle {
    let color: UIColor
    let maxSpeed: Double

    init(color: UIColor, maxSpeed: Double) {
        self.color = color
        self.maxSpeed = maxSpeed
    }

    func prettyMaxSpeed() -> String {
        return "The maximum speed is \(maxSpeed) mph"
    }
}

let vehicle = Vehicle(color: UIColor.blueColor(), maxSpeed: 200.0)

//: ## Inheritance
//: Classes inherit all attributes of their parent class

class WheeledVehicle: Vehicle {
    let wheels: Int

    init(color: UIColor, maxSpeed: Double, wheels: Int) {
        self.wheels = wheels
        super.init(color: color, maxSpeed: maxSpeed)
    }
}

let wheeled = WheeledVehicle(color: UIColor.orangeColor(), maxSpeed: 3.0, wheels: 3)

wheeled.prettyMaxSpeed()

//: ## Reference Types
//: Enums and Structs are **Value Types**. In other words, when assigning one instance of a value type to another, a copy is made. When changes are made to the copy, they are not reflected in the original object.

struct PersonStruct {
    var name: String
}

var person1 = PersonStruct(name: "Spark Student")
var person2 = person1
person2.name = "Another Student"

print(person1.name)
print(person2.name)


//: Classes are **Reference Types**. When assigning one instance of a reference type to another, they both refer to the same object.

class PersonClass {
    var name: String

    init(name: String) {
        self.name = name
    }
}

var person3 = PersonClass(name: "Spark Student")
var person4 = person3
person4.name = "Another Student"

print(person3.name)
print(person4.name)

//: ## Identity operators
//: Classes can be compared to see if they are the same object using the **identity operator**, ===

person3 === person4
var person5 = PersonClass(name: "Another Student")
person5 === person4
person5.name == person4.name


//: ## Type casting
//: Type casting is a way to check the type of an instance, and/or to treat that instance as if it is a different superclass or subclass from somewhere else in its own class hierarchy.

class Bicycle: WheeledVehicle {
    init(color: UIColor) {
        super.init(color: color, maxSpeed: 3.0, wheels: 2)
    }

    func rideBike() {
        print("Weee!!")
    }
}

//: ### Checking type
//: You can check to see if a variable is a certain class using the **is** keyword

var bike = Bicycle(color: UIColor.purpleColor())
bike is Bicycle
bike is WheeledVehicle
bike is Vehicle

wheeled is WheeledVehicle
wheeled is Bicycle

//: ### Downcasting
//: You can force a cast using the **as!** keyword. You can attempt to cast using the **if let ... as?** syntax

var aVehicle: Vehicle
aVehicle = Bicycle(color: UIColor.yellowColor())

//: You can't call rideBike() because as far as swift knows, you have a Vehicle object
//aVehicle.rideBike()

//: So let's cast it to a Bicycle

var aBike = aVehicle as! Bicycle
aBike.rideBike()

//: Or do it using **if let** syntax

if let aVehicle = bike as? Bicycle {
    bike.rideBike()
}

//: ## Any and AnyObject
//: When working with Cocoa APIs, it is common to receive an array with a type of **[AnyObject]**, or “an array of values of any object type”.

let array: [AnyObject] = [bike, person3]

//: You can cast AnyObject the same as before

for item in array {
    if let bike = item as? Bicycle {
        bike.rideBike()
    }
}

//: **Any** can represent an instance of any type at all, including function types.
var things = [Any]()
things.append(0)
things.append(0.0)
things.append(42)
things.append(3.14159)
things.append("hello")
things.append((3.0, 5.0))
things.append(Bicycle(color: UIColor.blueColor()))

//: You can use the **is** and **as** operators in a **switch** statement’s cases to discover the specific type of a constant or variable that is known only to be of type Any or AnyObject. The example below iterates over the items in the things array and queries the type of each item with a switch statement. Several of the switch statement’s cases bind their matched value to a constant of the specified type to enable its value to be printed.

for thing in things {
    switch thing {
    case 0 as Int:
        print("zero as an Int")
    case 0 as Double:
        print("zero as a Double")
    case let someInt as Int:
        print("an integer value of \(someInt)")
    case let someDouble as Double where someDouble > 0:
        print("a positive double value of \(someDouble)")
    case is Double:
        print("some other double value that I don't want to print")
    case let someString as String:
        print("a string value of \"\(someString)\"")
    case let (x, y) as (Double, Double):
        print("an (x, y) point at \(x), \(y)")
    case let bike as Bicycle:
        print(bike.color)
    case let stringConverter as String -> String:
        print(stringConverter("Michael"))
    default:
        print("something else")
    }
}


//: [TOC](Table%20of%20Contents) | [Previous](@previous) | Next
