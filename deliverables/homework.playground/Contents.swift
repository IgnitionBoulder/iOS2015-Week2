//: Shopping List - Week 2
//: This week we'll be building out the data model pieces of our shopping list app

import Foundation

//: Create a ListItem struct that will store the items for our shopping list. Include attributes for name and quantity
struct ListItem {
    let name: String
    let quantity: Int
    
    init(name: String, quantity: Int) {
        self.name = name
        self.quantity = quantity
    }
}
//: Create a ItemCategory enum for categories that our items could belong to. Include 'Grocery', 'Household', 'Clothing' and anything else that you think might be good.
enum ItemCategory: String {
    case Clothing
    case Grocery
    case Household
}

//: Create a ShoppingList class that will store our shopping list items, associated with the categories you created above. Include a quantity for each item type as well.
class ShoppingList {
    var list = [ItemCategory: [ListItem]]()
}
//: Add a method to your ShoppingList class to add an item, with it's associated category and a quantity
extension ShoppingList {
    func addItem(item: ListItem, category: ItemCategory){
        if list[category] == nil {
            list[category] = [item]
        }
        else {
            list[category]!.append(item)
        }
    }
}
//: Add a method to your ShoppingList class that will return a sorted list of your items in a particular category, sorted by name alphabetically.
extension ShoppingList {
    func Sort(category: ItemCategory) -> [ListItem]{
        return list[category]!.sort({$0.name.compare($1.name) == .OrderedAscending})
    }
}
//: Add a CustomStringConvertible extension to your ShoppingList class that will print your items, by category, with their quantities, with one item per line, sorted by name alphabetically. Include the header "Shopping List:", prefix each category with "*" and prefix each item with "  - ".
extension ShoppingList: CustomStringConvertible {
    var description: String{
        var output: String = "Shopping List:\n"
        for category in list{
            if category.1.count>0{
                output = output +  "* \(category.0.rawValue)\n"
                for item in self.Sort(category.0) {
                    output = output + "- \(item.name) - \(item.quantity)\n"
                }
            }
        }
        return output
    }
}
//: Create a method on ShoppingList that returns a new array containing the first letter of each category, in uppercase. The returned array should be sorted and not have any repeated characters.
extension ShoppingList {
    func categoryFirstLetters() -> [String]{
        var output: [String] = []
        for category in list{
            if category.1.count>0{
                output.append(String(category.0.rawValue.characters.first!).uppercaseString)
            }
        }
        return output.sort()
    }
    
}
//: Create a method that searches the items array and returns all items, in all categories, that match the input string. Ignore uppercase/lowercase differences.
extension ShoppingList{
    func itemsMatching(searchstring: String) -> [String]{
        var returnItems: [String] = []
        for category in list{
            for item in category.1{
                if item.name.lowercaseString.containsString(searchstring.lowercaseString){
                    returnItems.append(item.name)
                }
            }
        }
        return returnItems
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
print(firstLetters)
//
///* Expected Items: milk, broom */
let matchingItems = list.itemsMatching("m")
print(matchingItems)


