//: Shopping List - Week 2
//: This week we'll be building out the data model pieces of our shopping list app

import Foundation

//: Create a ListItem struct that will store the items for our shopping list. Include attributes for name and quantity

struct ListItem {
    var name: String
    var quantity: Int = 0
}

//: Create a ItemCategory enum for categories that our items could belong to. Include 'Grocery', 'Household', 'Clothing' and anything else that you think might be good.
// enum -- defining a new type with all possible values for that type

enum ItemCategory: String {
    case Grocery = "Grocery"
    case Household = "Household"
    case Toiletries = "Toiletries"
    case Pet = "Pet"
}

//: Create a ShoppingList class that will store our shopping list items, associated with the categories you created above. Include a quantity for each item type as well.

class ShoppingList {
    var allItems: [(item: ListItem, category: ItemCategory)]
    
    init() {
        self.allItems = []
    }
    
//: Add a method to your ShoppingList class to add an item, with it's associated category and a quantity
    
    func addItem(item: ListItem, category: ItemCategory) {
        self.allItems.append(item: item, category: category)
    }
    
//: Add a method to your ShoppingList class that will return a sorted list of your items in a particular category, sorted by name alphabetically.
    
    func sortByCategory(category: ItemCategory) -> [(item: ListItem, category: ItemCategory)] {
        return self.allItems.filter{($0.1 == category)}.sort({$0.0.name < $1.0.name})
    }
    
    func categories() -> [String] {
        var categoryArray: [String] = []
        for item in self.allItems {
            if (!categoryArray.contains(item.1.rawValue)) {
                categoryArray.append(item.1.rawValue)
            }
        }
        return categoryArray
    }
    
//: Create a method on ShoppingList that returns a new array containing the first letter of each category, in uppercase. The returned array should be sorted and not have any repeated characters.
    
    func categoryFirstLetters() -> [String] {
        var upcasedLetters: [String] = []
        for elem in self.allItems {
            let first = String(elem.1.rawValue.characters.first!)
            if (!upcasedLetters.contains(first)) {
                upcasedLetters.append(first)
            }
        }
        return upcasedLetters.sort()
    }

//: Create a method that searches the items array and returns all items, in all categories, that match the input string. Ignore uppercase/lowercase differences.
    func itemsMatching(input: String) -> [String] {
        var matchingElems: [String] = []
        for elem in self.allItems {
            if elem.0.name.lowercaseString.containsString(input.lowercaseString) {
                matchingElems.append(elem.0.name)
            }
        }
        return matchingElems
    }

}

//: Add a CustomStringConvertible extension to your ShoppingList class that will print your items, by category, with their quantities, with one item per line, sorted by name alphabetically. Include the header "Shopping List:", prefix each category with "*" and prefix each item with "  - ".

extension ShoppingList: CustomStringConvertible {
    var description: String {
        var printedList: String = "Shopping List\n"
        for category in self.categories() {
            printedList += "* \(category)\n"
            for item in self.sortByCategory(ItemCategory(rawValue: category)!) {
                printedList +=  " - \(item.0.name) - \(item.0.quantity)\n"
            }
        }
        return printedList
    }
}

//: Uncomment the code below and make sure your code above works properly

let apples = ListItem(name: "apples", quantity: 2)
let milk = ListItem(name: "milk", quantity: 2)
let bread = ListItem(name: "bread", quantity: 3)
let broom = ListItem(name: "broom", quantity: 1)
let bucket = ListItem(name: "bucket", quantity: 10)
bread.quantity


var list = ShoppingList()
list.addItem(apples, category: .Grocery)
list.addItem(bread, category: .Grocery)
list.addItem(milk, category: .Grocery)
list.addItem(broom, category: .Household)
list.addItem(bucket, category: .Household)

list.sortByCategory(.Grocery)
list.categories()

///* Expected output: 
//
//Shopping List:
//* Grocery
//  - bread - 3
//  - milk - 2
//* Household
//  - broom - 1
//*/

print(list)
//
///* Expected Array: ["G", "H"] */
let firstLetters = list.categoryFirstLetters()
//
///* Expected Items: milk, broom */
let matchingItems = list.itemsMatching("m")


