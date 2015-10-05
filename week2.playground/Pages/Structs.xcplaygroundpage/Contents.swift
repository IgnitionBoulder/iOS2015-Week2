//: # Structs
//: [TOC](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)

import Foundation

//: ## Structs
//: Structs are objects which contain properties and functionality. They are one of the basic building blocks of any app.

struct BlankStruct {

}

let blank = BlankStruct()

//: ## Properties
//: Structs contain properties (aka variables). All variables in a struct must be initialized with the 'init' method.

struct Point {
    let x: Double
    let y: Double

    init(x: Double = 0.0, yValue: Double = 0.0) {
        self.x = x
        y = yValue
    }
}

let point = Point(x: 10, yValue: 10)
print(point.y)

//: Like Enums, Structs can have computed properties, but since properties can be set as well, the syntax is a little different. The setter has a property called 'newValue'.

struct Person {
    var firstName: String
    var lastName: String

    var fullName: String {
        get {
            return "\(firstName) \(lastName)"
        }
        set {
            let components = newValue.componentsSeparatedByString(" ")
            self.firstName = components[0]
            self.lastName = components[1]
        }
    }

    init(first: String, last: String) {
        firstName = first
        lastName = last
    }
}

let person = Person(first: "Spark", last: "Student")
print(person.fullName)

var person2 = Person(first: "Another", last: "Student")
person2.fullName = "Third Student"
print(person2.firstName)

//: In addition to setters and getters, you can use 'willSet' and 'didSet' to observer changes to your struct object. Note that you can use these on any property, either stored or computed.

struct Car {
    var make: String {
        willSet {
            print("The car's make is going to change from \(make) to \(newValue).")
        }
    }
    var model: String {
        didSet {
            print("The car's model changed from \(oldValue) to \(model)")
        }
    }

    init(make: String, model: String) {
        self.make = make
        self.model = model
    }
}

var car = Car(make: "Honda", model: "Accord")
print("Car: \(car.make) \(car.model)")

car.make = "Toyota"
car.model = "Camry"
print("Car: \(car.make) \(car.model)")


//: [TOC](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
