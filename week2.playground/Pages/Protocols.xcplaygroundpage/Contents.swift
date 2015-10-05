//: # Protocols
//: [TOC](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)

import Foundation

//: ## Protocols
//: A protocol defines a blueprint of methods, properties, and other requirements that suit a particular task or piece of functionality. The protocol can then be adopted by a class, structure, or enumeration to provide an actual implementation of those requirements. Any type that satisfies the requirements of a protocol is said to conform to that protocol.


//: ## Protocol definition
//: Variables are defined using both type and whether they are gettable or settable
//: Functions are defined using their definition, but no implementation

protocol Feedable {
    var foodType: String { get }
    func feed()
}

//: ## Conforming to a protocol
//: You conform to a protocl
//: To conform to a protocol, an object must implement all variables and functions

struct Bird : Feedable {
    var foodType = "Seed"
    func feed() {
        // Do some stuff
    }
}

//: You can have many different objects conform to the same protocol

struct Fish: Feedable {
    var foodType = "Plankton"
    func feed() {
        // Do some stuff
    }
}

//: Structs can conform to multiple protocols

protocol Named {
    var name: String { get }
}

struct Person: Feedable, Named {
    var foodType = "Pizza"
    var name = "Bob"
    func feed() {
        // Do some stuff
    }
}

//: ## Mutating functions
//: Functions that modify the object must be marked **mutating**

protocol Nameable {
    mutating func setName(name: String)
}

struct Dog: Named, Nameable {
    var name = "Rover"
    mutating func setName(name: String) {
        self.name = name
    }
}

//: ## Testing to see if an object conforms to a protocol
//: You can check to see if an object conforms to a protocol using the if let statement, along with **as?**, which tries to cast the object to the type

var dog = Dog(name: "Fido")
if let dog = dog as? Named {
    print("Dog is named")
}

if let dog = dog as? Feedable {
    print("Dog is feedable")
}

//: ## Protocols in Extensions
//: Object extensions can conform to protocols to provide additional functionality

protocol Aged {
    var age: Int { get }
}

extension Dog: Aged {
    var age: Int {
        return 3
    }
}

//: ## Collections of protocols
//: We can store objects of different types in an array using their protocol type

let fish = Fish()
let bird = Bird()
let person = Person()

var feedableArray: [Feedable] = [fish, bird, person]

//: We can't append 'dog', becase the Dog struct doesn't conform to **Feedable**
//feedableArray.append(dog)

//: We can now use the variables or functions defined in the **Feedable** protocol
for item in feedableArray {
    print(item.foodType)
}

//: ## Using objects that conform
//: You can use objects of a particular protocol as arguments to a function

func printFoodType(item: protocol<Feedable>) {
    print(item.foodType)
}
printFoodType(bird)

//: Again, 'dog' is not **Feedable**, so we can't use it in this function
//printFoodType(dog)

//: You can also require arguments to conform to multiple protocols
func printBirthdayGreeting(item: protocol<Aged, Named>) {
    print("Happy Birthday \(item.name), you're \(item.age)!")
}
printBirthdayGreeting(dog)


//: ## Built in Protocols
//: **Foundation** has quite a few built in protocols that you can have your objects conform to.
//: For example, structs can be pretty printed by creating an extension conforming to the **CustomStringConvertible** protocol

struct Car {
    var make: String
    var model: String

    init(make: String, model: String) {
        self.make = make
        self.model = model
    }
}

extension Car : CustomStringConvertible {
    var description: String {
        return "\(self.make) \(self.model)"
    }
}

var car = Car(make: "Honda", model: "Accord")

print(car)


//: [TOC](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
