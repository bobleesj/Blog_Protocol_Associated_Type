//: Protocol Associated Type





//: Override Associated Type 

protocol Container {
  
  associatedtype ItemType = Int
  func getItem() -> ItemType
  func getItems() -> [ItemType]
}


class Backpack: Container { // because ItemType has default associatedtype, we don't have to specify it
  
  func getItem() -> Backpack.ItemType {
    return 2
  }
  
  func getItems() -> [Backpack.ItemType] {
    return [2]
  }
}




struct TypedBackpack<TypedItemType: ExpressibleByStringLiteral>: Container {
  // but we can override current associatedtype quite easily
  
  func getItem() -> TypedItemType { // Because ItemType doesn't need to conform to any protocol, we can easily pass our own ItemType
    return ""
  }
  
  func getItems() -> [TypedItemType] {
    return [""]
  }
}

let backpack1 = Backpack()
let backpack2 = TypedBackpack<String>()
print(backpack1.getItem())
print(backpack2.getItem())


