//: Shopping List - Week 2
//: This week we'll be building out the data model pieces of our shopping list app

import Foundation

//: Create a ListItem struct that will store the items for our shopping list. Include attributes for name and quantity

struct ListItem {
    var name: String
    var quantity: Int
}

//: Create a ItemCategory enum for categories that our items could belong to. Include 'Grocery', 'Household', 'Clothing' and anything else that you think might be good.

enum ItemCategory : String {
    case Grocery = "grocery"
    case Household = "household"
    case Clothing = "clothing"
}


//: Create a ShoppingList class that will store our shopping list items, associated with the categories you created above. Include a quantity for each item type as well.

class ShoppingList {
    var groceryItems : [ListItem]
    var groceryNum : Int
    var householdItems : [ListItem]
    var householdNum : Int
    var clothingItems : [ListItem]
    var clothingNum : Int
    
    init(){
        groceryItems = []
        groceryNum = 0
        householdItems = []
        householdNum = 0
        clothingItems = []
        clothingNum = 0
    }

//: Add a method to your ShoppingList class to add an item, with it's associated category and a quantity

    func addItem(item: ListItem, category: ItemCategory){
        switch category {
        case .Grocery :
            groceryItems.append(item)
        case .Household :
            householdItems.append(item)
        case .Clothing :
            clothingItems.append(item)
        }
    }

//: Add a method to your ShoppingList class that will return a sorted list of your items in a particular category, sorted by name alphabetically.
    func sortedListOf(category: ItemCategory) -> [ListItem]{
        switch category {
        case .Grocery :
            return groceryItems
        case .Household :
            return householdItems
        case .Clothing :
            return clothingItems
        }
    }

//: Create a method on ShoppingList that returns a new array containing the first letter of each category, in uppercase. The returned array should be sorted and not have any repeated characters.

    func categoryFirstLetters() -> [String] {
        var categoriesWithItems = [String]()
        var letters = [String]()
        if groceryItems.count != 0 {            //could these be in a nested function? lots of repeated code...
            categoriesWithItems.append("Grocery")
        }
        if householdItems.count != 0 {
            categoriesWithItems.append("Household")
        }
        if clothingItems.count != 0 {
            categoriesWithItems.append("Clothing")
        }
        for category in categoriesWithItems {
            let category = category.uppercaseString
            if let letter = category.characters.first {  // I don't fully understand why this is an optional
                if !letters.contains(String(letter)){
                    letters += [String(letter)]
                }
            }
        }
        letters = letters.sort()
        return letters
    }

//: Create a method that searches the items array and returns all items, in all categories, that match the input string. Ignore uppercase/lowercase differences.

    func itemsMatching(letter: String) -> [ListItem] {
        var itemsToReturn = [ListItem]()
        for item in groceryItems{
            if item.name.containsString(letter){
                itemsToReturn.append(item)      //could these be in a nested function? lots of repeated code...
            }
        }
        for item in householdItems{
            if item.name.containsString(letter){
                itemsToReturn.append(item)
            }
        }
        for item in clothingItems{
            if item.name.containsString(letter){
                itemsToReturn.append(item)
            }
        }
        return itemsToReturn
    }
}

//: Add a CustomStringConvertible extension to your ShoppingList class that will print your items, by category, with their quantities, with one item per line, sorted by name alphabetically. Include the header "Shopping List:", prefix each category with "*" and prefix each item with "  - ".

extension ShoppingList : CustomStringConvertible {
    var description : String {
        var returnString : String = ""
        returnString += "\nShopping List: \n"
        if self.groceryItems.count != 0 {
            returnString += "* Grocery \n"      //could these be in a nested function? lots of repeated code...
            for item in self.groceryItems {
                returnString += "  - \(item.name) - \(item.quantity) \n"
            }
        }
        if self.householdItems.count != 0 {
            returnString += "* Household \n"
            for item in self.householdItems {
                returnString += "  - \(item.name) - \(item.quantity) \n"
            }
        }
        if self.clothingItems.count != 0 {
            returnString += "* Clothing \n"
            for item in self.clothingItems {
                returnString += "  - \(item.name) - \(item.quantity) \n"
            }
        }
        return returnString
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


