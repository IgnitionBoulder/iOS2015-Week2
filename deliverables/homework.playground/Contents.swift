//: Shopping List - Week 2
//: This week we'll be building out the data model pieces of our shopping list app

import Foundation

import UIKit

//: Create a ListItem struct that will store the items for our shopping list. Include attributes for name and quantity
struct ListItem {
    
    var name: String
    
    var quantity: Int
    
    init(name: String, quantity: Int) {
       
        self.name = name
        
        self.quantity = quantity
    }
    
}
//: Create a ItemCategory enum for categories that our items could belong to. Include 'Grocery', 'Household', 'Clothing' and anything else that you think might be good.
enum ItemCategory {
    case Grocery
    case Household
    case Clothing
    case Others
}
//: Create a ShoppingList class that will store our shopping list items, associated with the categories you created above. Include a quantity for each item type as well.
class ShoppingList {
    
    var name: String?
    
    var quantity = 1
    
    var category: String?
    
//: Add a method to your ShoppingList class to add an item, with it's associated category and a quantity
var shoppinglist = Dictionary<String, Int>()

func addItem(name: String, category: ItemCategory){

    
    }


//: Add a method to your ShoppingList class that will return a sorted list of your items in a particular category, sorted by name alphabetically.
func printArray(array: [String]) {
    var count: Int = 0
    for item in array {
        print("\(count) - \(item)")
        count = count + 1
    }
}

func printSortedArray(array: [String]) {
    let newArray = array.sort()
    printArray(newArray)
}


//: Add a CustomStringConvertible extension to your ShoppingList class that will print your items, by category, with their quantities, with one item per line, sorted by name alphabetically. Include the header "Shopping List:", prefix each category with "*" and prefix each item with "  - ".
extension ListItem : CustomStringConvertible {
    var description: String {
        return "\(self.name) \(self.quantity)"
    }
}

print("Shopping List:\n" "*\(category)\n" "-\(name)-\(quantity)")
//: Create a method on ShoppingList that returns a new array containing the first letter of each category, in uppercase. The returned array should be sorted and not have any repeated characters.
func categoryFirstLetters(array: [String]) -> [String] {
    let sorted = array.sort()
    var letters = [String]()
    for item in sorted {
        if let letter = item.characters.first {
            let uppercase = String(letter).uppercaseString
            if !letters.contains(uppercase) {
                letters.append(uppercase)
            }
        }
    }
    
    return letters
}

//: Create a method that searches the items array and returns all items, in all categories, that match the input string. Ignore uppercase/lowercase differences.
func itemsMatching(array: [String], elephant: String) -> [String] {
    var itemsToReturn = [String]()
    
    for item in array {
        let lowercase = item.lowercaseString
        if lowercase.containsString(elephant.lowercaseString) {
            itemsToReturn.append(item)
        }
    }
    
    return itemsToReturn
}

//: Uncomment the code below and make sure your code above works properly

let milk = ListItem(name: "milk", quantity: 2)
let bread = ListItem(name: "bread", quantity: 3)
let broom = ListItem(name: "broom", quantity: 1)

var list = ShoppingList()
list.addItem(bread, category: .Grocery)
list.addItem(milk, category: .Grocery)
list.addItem(broom, category: .Household)

/* Expected output: 

Shopping List:
* Grocery
  - bread - 3
  - milk - 2
* Household
  - broom - 1
*/
print(list)

/* Expected Array: ["G", "H"] */
let firstLetters = list.categoryFirstLetters()

/* Expected Items: milk, broom */
let matchingItems = list.itemsMatching("m")

}
