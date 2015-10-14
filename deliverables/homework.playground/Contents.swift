//: Shopping List - Week 2
//: This week we'll be building out the data model pieces of our shopping list app

import Foundation

//: Create a ListItem struct that will store the items for our shopping list. Include attributes for name and quantity
struct ListItem {
    let itemName: String
    let itemQuantity: Int
    init(name: String, quantity: Int) {
        itemName = name
        itemQuantity = quantity
    }
}

//: Create a ItemCategory enum for categories that our items could belong to. Include 'Grocery', 'Household', 'Clothing' and anything else that you think might be good.
enum itemCategory {
    case Grocery
    case Household
    case Clothing
}


//: Create a ShoppingList class that will store our shopping list items, associated with the categories you created above. Include a quantity for each item type as well.

class ShoppingList: CustomStringConvertible {
    var groceriesToBuy = [ListItem] ()
    var householdsToBuy = [ListItem] ()
    var clothingToBuy = [ListItem] ()
    var groceryCount = Int (0)
    var householdCount = Int (0)
    var clothingCount = Int (0)
    //: Add a method to your ShoppingList class to add an item, with it's associated category and a quantity
    func addItem(item: ListItem, category: itemCategory) {
        switch category {
        case .Grocery:
            groceriesToBuy.append(item)
            groceryCount += item.itemQuantity
        case .Household:
            householdsToBuy.append(item)
            householdCount += item.itemQuantity
        case .Clothing:
            clothingToBuy.append(item)
            clothingCount += item.itemQuantity
        }
    }
    //: Add a method to your ShoppingList class that will return a sorted list of your items in a particular category, sorted by name alphabetically.
    func sortedList(category: itemCategory) -> [ListItem] {
        var alphabeticalList = [ListItem] ()
        switch category {
        case .Grocery:
            alphabeticalList = groceriesToBuy
        case .Household:
            alphabeticalList = householdsToBuy
        case .Clothing:
            alphabeticalList = clothingToBuy
        }
        return alphabeticalList.sort{$0.itemName < $1.itemName}
    }
    //: Add a CustomStringConvertible extension to your ShoppingList class that will print your items, by category, with their quantities, with one item per line, sorted by name alphabetically. Include the header "Shopping List:", prefix each category with "*" and prefix each item with "  - ".
    var description: String {
        var printedItems = ""
        printedItems += "Shopping List:\n"
        if groceryCount > 0 {
            printedItems += "* Grocery\n"
            for item in groceriesToBuy {
                printedItems += "  - " + item.itemName + " - "
                printedItems += String(item.itemQuantity) + "\n"
            }
        }
        if householdCount > 0 {
            printedItems += "* Household\n"
            for item in householdsToBuy {
                printedItems += "  - " + item.itemName + " - "
                printedItems += String(item.itemQuantity) + "\n"
            }
        }
        if clothingCount > 0 {
            printedItems += "* Clothing\n"
            for item in clothingToBuy {
                printedItems += "  - " + item.itemName + " - "
                printedItems += String(item.itemQuantity) + "\n"
            }
        }
        return printedItems
    }
    //: Create a method on ShoppingList that returns a new array containing the first letter of each category, in uppercase. The returned array should be sorted and not have any repeated characters.
    func categoryFirstLetters() -> [String] {
        var usedCategories = [String] ()
        if groceryCount > 0 {
            usedCategories.append("Grocery")
        }
        if householdCount > 0 {
            usedCategories.append("Household")
        }
        if clothingCount > 0 {
            usedCategories.append("Clothing")
        }
        return firstCapitalLetter(usedCategories)
    }
    
    func firstCapitalLetter (list: [String]) -> [String] {
        var newList = [String] ()
        for word in list.sort(<) {
            let firstLetter = word.characters.first
            if !newList.contains(String(firstLetter!)) {
                newList.append(String(firstLetter!).uppercaseString)
            }
        }
        return(newList)
    }
    //: Create a method that searches the items array and returns all items, in all categories, that match the input string. Ignore uppercase/lowercase differences.
    func itemsMatching(searchString: String) -> [ListItem] {
        var newList = [ListItem] ()
        let combinedLists = groceriesToBuy + householdsToBuy + clothingToBuy
        for item in combinedLists {
            if item.itemName.lowercaseString.rangeOfString(searchString.lowercaseString) != nil {
                newList.append(item)
            }
        }
        return(newList)
    }
}
//: Uncomment the code below and make sure your code above works properly

let milk = ListItem(name: "milk", quantity: 2)
let bread = ListItem(name: "bread", quantity: 3)
let broom = ListItem(name: "broom", quantity: 1)

var list = ShoppingList()
list.addItem(bread, category: .Grocery)
list.addItem(milk, category: .Grocery)
list.addItem(broom, category: .Household)
//
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


