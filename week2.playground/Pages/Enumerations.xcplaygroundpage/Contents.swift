//: # Enumerations
//: [TOC](Table%20of%20Contents) | Previous | [Next](@next)

import UIKit

//: ## Enumerations
//: An enumeration defines a common type for a group of related values and enables you to work with those values in a type-safe way within your code.

enum Animal {
    case Dog
    case Cat
    case Hamster
}

var pet = Animal.Dog
pet = .Cat

let anotherPet: Animal
anotherPet = .Hamster

//: ## Switch
//: Switches allow for easy selection of functionality based on the value of an enum

func defaultPetName(pet: Animal) -> String {
    switch pet {
    case .Dog:
        return "Fido"
    case .Cat:
        return "Fluffy"
    case .Hamster:
        return "Hammy"
    }
}

print(defaultPetName(.Hamster))

//: ## Extensions
//: Extensions add functionality to an object

extension Animal {
}

//: ## Functions
//: Enumerations in Swift can contain functions, unlike many languages

extension Animal {
    func feed(times: Int) -> String {
        if(times > 50) {
            return "Oh no! You fed the animal too many times. It's dead. 😥"
        } else {
            return "You fed the animal and now it's happy and loves you. 😻"
        }
    }
}

print(pet.feed(3))
print(pet.feed(100))


//: ## Computed Properties
//: Enums can contain variables that are computed at run time, rather than compile time.

extension Animal {
    var color: UIColor {
        switch self {
        case .Dog:
            return UIColor.whiteColor()
        case .Cat:
            return UIColor.blackColor()
        case .Hamster:
            return UIColor.brownColor()
        }
    }
}

anotherPet.color

//: ## Enum Raw Values
//: Enum cases have an underlying raw value if a type is assigned

enum ElementaryGrade: Int {
    case first = 1
    case second
    case third
    case fourth
}

let grade = ElementaryGrade.third

print(grade.rawValue)

let newGrade = ElementaryGrade(rawValue: 2)

//: ## Enum Raw Values with Strings
//: Enums can represent Strings, or other built in types, in addition to Ints

enum MexicanDish: String {
    case Taco = "Taco"
    case Burrito = "Yummy Burrito"
    case Fajita
}

let burrito = MexicanDish.Burrito
print(burrito.rawValue)

let taco = MexicanDish(rawValue: "Taco")

//: Swift will create a default raw value for string enum cases
let fajita = MexicanDish.Fajita
print(fajita.rawValue)

//: ## Enum equality
//: All enums of the same type are equal to each other

var dish = MexicanDish.Burrito
print(dish == burrito)
print(dish == taco)
print(dish.rawValue == MexicanDish.Burrito.rawValue)

//: Reminder, cannot compare values of different types
//print(dish == "Taco")

//: ## Switch statements with multiple values

func whichMeat(dish: MexicanDish) -> String {
    switch dish {
    case .Taco, .Burrito:
        return "Beef"
    case .Fajita:
        return "Shrimp"
    }
}

whichMeat(.Taco)

//: ## Switch statement with optionals

func isGone(dish: MexicanDish?) -> String {
    switch dish {
    case .None:
        return "All gone"
    case .Some(.Burrito):
        return "Some burrito left"
    default:
        return "Some food left"
    }
}

isGone(nil)
isGone(dish)
isGone(taco)



//: [TOC](Table%20of%20Contents) | Previous | [Next](@next)
