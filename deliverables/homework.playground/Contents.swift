import Foundation


// Create a ListItem struct that will store the items for our shopping list.  Include attributes for name and quantity

struct ListItem {
    let name: String
    var quantity: Int
}


// Create a ItemCategory enum for categories that our items could belong to.  Include 'Grocery', 'Household', 'Clothing' and anything else that you think might be good

enum ItemCategory: String {
    case Grocery
    case Household
    case Clothing
    
}


// Create a ShoppingList class that will store our shopping list items, associated with the categories you created above.  Include a quantity for each item type as well

class ShoppingList {
    var items = [ItemCategory: [ListItem]]()
    
}


// Add a method to your ShoppingList class to add an item, with it's associated category and a quantity

extension ShoppingList {
    func addItem(item: ListItem, category: ItemCategory) {
        var itemsForCategory = items[category]
        if itemsForCategory == nil {
            itemsForCategory = [ListItem]()
        }
        itemsForCategory?.append(item)
        items[category] = itemsForCategory
    }
}

//  ******* NOTE *******  >  We have to create the variable itemsForCategory = items[category]
//  ******* NOTE *******  >  This creates an array of items categorys to iterate through and check for values
//  ******* HELP *******  >  Need further understanding on the logic behind checking nil, and then appending ????


// Add a method to your ShoppingList class that will return a sorted list of your items in a particular category, sorted by name alphabetically

extension ShoppingList {
    func sortedList(category: ItemCategory) -> [ListItem] {
        guard let itemsForCategory = items[category] else {
            return [ListItem]()
        }
        
        return itemsForCategory.sort({ $0.name.compare($1.name) == .OrderedAscending })
        
    }
}


// Add a CustomStringConvertible extension to your ShoppingList class that will print your items, by category, with their quantities, with one item per line, sorted by name alphabetically. Include the header "Shopping List:", prefix each category with "*" and prefix each item wit " - "

extension ShoppingList: CustomStringConvertible {
    var description: String {
        var string = "Shopping List:\n"
        print(items.count)
        for category in items.keys {
            string += "* \(category.rawValue)\n"
            for item in sortedList(category) {
                string += " -\(item.name) - \(item.quantity)\n"
            }
        }
        
        return string
    }
}


// Create a method on ShoppingList that returns a new array containing the first letter of each category, in uppercase.  The returned array should be sorted and not have any repeated characters

extension ShoppingList {
    
    func categoryFirstLetters() -> [String] {
        var firstLetters = [String]()
        for item in items.keys {
            let firstLetter = String(item.rawValue.characters.first!).uppercaseString
            if !firstLetters.contains(firstLetter) {
                firstLetters.append(firstLetter)
            }
        }
        return firstLetters.sort()
    }
}


// Create a method that searches the items array and returns all items, in all categories, that match the input string.  Ignore uppercase/lowercase differences

extension ShoppingList {
    
    func itemsMatching(searchString: String) -> [ListItem] {
        var matchingItems = [ListItem]()
        for array in items.values {
            for listItem in array {
                if listItem.name.lowercaseString.containsString(searchString.lowercaseString) {
                    matchingItems.append(listItem)
                }
            }
        }
        return matchingItems
    }
}


// Code to test the functionality of our ShoppingList class

let milk = ListItem(name: "milk", quantity: 2)
let bread = ListItem(name: "bread", quantity: 3)
let broom = ListItem(name: "broom", quantity: 1)

var list = ShoppingList() 
list.addItem(bread, category: .Grocery)
list.addItem(milk, category: .Grocery)
list.addItem(broom, category: .Household)



