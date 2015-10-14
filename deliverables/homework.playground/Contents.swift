//: Shopping List - Week 2
//: This week we'll be building out the data model pieces of our shopping list app

import Foundation

//: Create a ListItem struct that will store the items for our shopping list. Include attributes for name and quantity

struct ListItem {
    let name: String
    let quantity: Double
    
    init(name: String, quantity: Double) {
        self.name = name
        self.quantity = quantity
    }
}


//: Create a ItemCategory enum for categories that our items could belong to. Include 'Grocery', 'Household', 'Clothing' and anything else that you think might be good.

enum ItemCategory{
    case Grocery
    case Household
    case Clothing
    case Auto
    case electronics
}


//: Create a ShoppingList class that will store our shopping list items, associated with the categories you created above. Include a quantity for each item type as well.

class ShoppingList{
    var list = ["Grocery": [ListItem](), "Household": [ListItem](), "Clothing": [ListItem](), "Auto": [ListItem](), "electronics": [ListItem]()]
}

//: Add a method to your ShoppingList class to add an item, with it's associated category and a quantity

extension ShoppingList{
    func addItem(monkey: ListItem, category: ItemCategory){
        switch category{
        case .Grocery:
            list["Grocery"]?.append(monkey)
        case .Household:
            list["Household"]?.append(monkey)
        case .Clothing:
            list["Clothing"]?.append(monkey)
        case .Auto:
            list["Auto"]?.append(monkey)
        case .electronics:
            list["electronics"]?.append(monkey)
            
        }
    }
    
}

//: Add a method to your ShoppingList class that will return a sorted list of your items in a particular category, sorted by name alphabetically.
extension ShoppingList{
    func sortItems(Category: ItemCategory)->[ListItem]{
        var newarray: [ListItem]
        switch Category{
        case .Grocery:
            newarray = (list["Grocery"])!
            newarray.sort{$0.name > $1.name}
        case .Household:
            newarray = (list["Household"])!
            newarray.sort{$0.name > $1.name}
        case .Clothing:
            newarray = (list["Clothing"])!
            newarray.sort{$0.name > $1.name}
        case .Auto:
            newarray = (list["Auto"])!
            newarray.sort{$0.name > $1.name}
        case .electronics:
            newarray = (list["electronics"])!
            newarray.sort{$0.name > $1.name}
        }
        return newarray
    }
}

//: Add a CustomStringConvertible extension to your ShoppingList class that will print your items, by category, with their quantities, with one item per line, sorted by name alphabetically. Include the header "Shopping List:", prefix each category with "*" and prefix each item with "  - ".
extension ShoppingList : CustomStringConvertible{
    var description: String {
        sortItems(.Grocery)
        sortItems(.Household)
        sortItems(.electronics)
        sortItems(.Clothing)
        sortItems(.Auto)
        var output: String = "Shopping List: \n"
        if list["Grocery"]?.count > 0
        {
            output += " Grocery \n"
            for index in list["Grocery"]!
            {
                output += " - " + index.name
                output += " - " + String(index.quantity) + "\n"
            }
        }
        if list["Household"]?.count > 0
        {
            output += " Household \n"
            for index in list["Household"]!
            {
                output += " - " + index.name
                output += " - " + String(index.quantity) + "\n"
            }
        }
        if list["Clothing"]?.count > 0
        {
            output += " Clothing \n"
            for index in list["Clothing "]!
            {
                output += " - " + index.name
                output += " - " + String(index.quantity) + "\n"
            }
        }
        if list["electronics"]?.count > 0
        {
            output += " electronics \n"
            for index in list["electronics"]!
            {
                output += " - " + index.name
                output += " - " + String(index.quantity) + "\n"
            }
        }
        if list["Auto"]?.count > 0
        {
            output += " Auto \n"
            for index in list["Auto"]!
            {
                output += " - " + index.name
                output += " - " + String(index.quantity) + "\n"
            }
        }
        return output
    }
}

//: Create a method on ShoppingList that returns a new array containing the first letter of each category, in uppercase. The returned array should be sorted and not have any repeated characters.
extension ShoppingList{
    func categoryFirstLetters() ->[String]{
        var letterArray: [String] = []
        for key in list.keys{
            if list[key]?.count != 0
            {
                letterArray.append(String(key.uppercaseString.characters.first!))
            }
        
        letterArray.sortInPlace()
            letterArray = Array(Set(letterArray))
    
        }
        return letterArray
    }
}
//: Create a method that searches the items array and returns all items, in all categories, that match the input string.  Ignore uppercase/lowercase differences.
    extension ShoppingList{
        func itemsMatching(searchstring: String) -> [String]{
            var match: [String] = []
            for key in list.keys
            {
                if list[key]?.count != 0 {
                    for i in list[key]!
                    {
                        
                        let currentWord1: String = i.name.uppercaseString
                        var s = searchstring.uppercaseString
                        if currentWord1.containsString(s)
                        {
                            let currentword: String = i.name
                            match.append(currentword)
                        }
            
                    }
                }
            }
            return match
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

// Expected output:

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


