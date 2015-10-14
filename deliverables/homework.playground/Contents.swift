//: Shopping List - Week 2
//: This week we'll be building out the data model pieces of our shopping list app

import Foundation

//: Create a ListItem struct that will store the items for our shopping list. Include attributes for name and quantity
struct ListItem {
    let name: String
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
}
//: Create a ShoppingList class that will store our shopping list items, associated with the categories you created above. Include a quantity for each item type as well.
class ShoppingList {
    var theList = ["Grocery": [ListItem](), "Household": [ListItem](), "Clothing": [ListItem]()] //Dictionary where the key is a category and
    //the value is an array of ListItems
    
    //: Add a method to your ShoppingList class to add an item, with it's associated category and a quantity
    func addItem(item: ListItem, category: ItemCategory) {
            switch category {
            case .Grocery: //If it is a grocery item
                theList["Grocery"]?.append(item)//add it to the grocery array
            case .Household://If it is a household item
                theList["Household"]?.append(item)//add it to the household array
            case .Clothing://etc
                theList["Clothing"]?.append(item)
            }
        }
    //: Add a method to your ShoppingList class that will return a sorted list of your items in a particular category, sorted by name alphabetically.
    func sortCategory(category: ItemCategory)->[ListItem]{
        var newArray: [ListItem]
        switch category {
        case .Grocery:
            newArray = (theList["Grocery"])!
            newArray.sort{ $0.name > $1.name } //Sorts array based on name aphebetically
        case .Household:
            newArray = (theList["Household"])!
            newArray.sort{ $0.name > $1.name }
        case .Clothing:
            newArray = (theList["Clothing"])!
            newArray.sort{ $0.name > $1.name }
        }
        return newArray
    }
  //: Create a method on ShoppingList that returns a new array containing the first letter of each category, in uppercase. The returned array should be sorted and not have any repeated characters.
    func firstLetters()->[String]{
        var letterArray: [String] = []
        for key in theList.keys { //Iterate through all the categories
            if theList[key]?.count != 0 //If the category isnt empty
            {
            letterArray.append(String(key.uppercaseString.characters.first!)) //Add the first letter of the category to the new array
            }
        }
        letterArray.sortInPlace() //sort array
        return letterArray
    }
    //: Create a method that searches the items array and returns all items, in all categories, that match the input string. Ignore uppercase/lowercase differences.
    func search(searchWord: String)->[String]{
        var matches: [String] = []
        for key in theList.keys { //Iterate through categories
            if theList[key]?.count != 0 //If the category is not empty
            {
                for shopitem in theList[key]! //iterate through the items for that category
                {
                    let currentWord: String = shopitem.name.uppercaseString //Capitalize current items name for consistency
                    if currentWord == searchWord.uppercaseString //Does it match the capitalized input?
                    {
                        matches.append(shopitem.name)//add the word to the array
                    }
                }
            }
        }
        return matches
    }

}

//: Add a CustomStringConvertible extension to your ShoppingList class that will print your items, by category, with their quantities, with one item per line, sorted by name alphabetically. Include the header "Shopping List:", prefix each category with "*" and prefix each item with "  - ".

extension ShoppingList : CustomStringConvertible {
    var description: String {
        sortCategory(.Grocery) //Sort the categories
        sortCategory(.Household)
        sortCategory(.Clothing)
        var finalString: String = ""
        finalString += "Shopping List\n"
        if theList["Grocery"]?.count > 0 //If there are grocery items
        {
            finalString += "* Grocery\n"
            for index in theList["Grocery"]! {
                finalString += " - " + (index.name) //add name
                finalString += " - " + String(index.quantity) + "\n" //add quantity
            }
        }
        if theList["Household"]?.count > 0 //If there are household items
        {
            finalString += "* Household\n"
            for index in theList["Household"]! {
                finalString += " - " + (index.name)
                finalString += " - " + String(index.quantity) + "\n"
            }
        }
        if theList["Clothing"]?.count > 0 //If there are clothing items
        {
            finalString += "* Clothing\n"
            for index in theList["Clothing"]! {
                finalString += " - " + (index.name)
                finalString += " - " + String(index.quantity) + "\n"
            }
        }
        return (finalString)
    }
}


//: Uncomment the code below and make sure your code above works properly

let milk = ListItem(name: "milk", quantity: 2)
let bread = ListItem(name: "bread", quantity: 3)
let broom = ListItem(name: "broom", quantity: 1)
//
var list = ShoppingList()
list.addItem(bread, category: .Grocery)
list.addItem(milk, category: .Grocery)
list.addItem(broom, category: .Household)
print(list)
list.firstLetters()
list.search("Cheese")
list.search("BROOM")
list.search("bRoOm")
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
//print(list)
//
///* Expected Array: ["G", "H"] */
//let firstLetters = list.categoryFirstLetters()
//
///* Expected Items: milk, broom */
//let matchingItems = list.itemsMatching("m")


