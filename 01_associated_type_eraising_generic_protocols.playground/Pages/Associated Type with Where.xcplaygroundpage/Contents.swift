

//: Generic Function
func genericFunc<T>(enter: T) {
  print(enter)
}

//: Generic Struct 
struct genericStruct<T> {
  var property: T
}


//: Protoocl Associatity

// Begin with a normal protocol 
protocol NormalProtocol {
  var property: String { get set }
}

class NormalClass: NormalProtocol {
  var property: String = "Bob"
}



//: Introducing Protocol Associated Types
protocol GenericProtocol {
  associatedtype type
  var anyProperty: type { get set }
}

class SomeClass: GenericProtocol {
  // typealias type = String
  // var anyProperty: type = "Bob"
  var anyProperty = "Bob"
}

struct SomeStruct: GenericProtocol {
  var anyProperty = 1996
}

extension GenericProtocol {
  static func introduce() {
    print("I'm Bob")
  }
}

SomeClass.introduce()
SomeStruct.introduce()


//: Generic Constraints
func function<T: GenericProtocol>(enter: T) {
}

// Where Clause and Self
extension GenericProtocol where type == String, Self == SomeClass {
  func conclude(){
    print("Bob, out")
  }
}


let someClassInstance = SomeClass()
let someStructInstance = SomeStruct()

//: Override Associated Type 

protocol Familiable {
  associatedtype FamilyType = Int
  func getName() -> [FamilyType]
}

/*
 class NumberFamily: Familyable {
 func getName() -> [FamilyType] {
 return [1, 2, 3]
 }
 }
 */

class NumberFamily: Familiable {
  func getName() -> [Int] {
    return [1, 2, 3]
  }
}



struct NormalFamily<TypedItemType: ExpressibleByStringLiteral>: Familiable  {
  func getName() -> [TypedItemType] {
    return ["Bob", "Bobby", "Lee"]
  }
}

let numberFam = NumberFamily()
let normalFam = NormalFamily()
// let normalFam = NormaFamily<String>()





