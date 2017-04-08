protocol MythicalType {
  associatedtype FoodType
  func prepareFood() -> [FoodType]
  func devour(_: FoodType) -> Void
}

struct Human { }
struct Vegetable { }

class Kraken: MythicalType {
  func devour(_: Human) {
  }
  
  func prepareFood() -> [Human] {
    return [Human()]
  }
}

class Bobby: MythicalType {
  func devour(_: Vegetable) {
    
  }
  
  func prepareFood() -> [Vegetable] {
    return [Vegetable()]
  }
}

class Storybook<T: MythicalType> {}
func writeBookAbout<T: MythicalType>(myth: T) {}

//: 'MythicalType' can only be used as a generic constraint because it has Self or associated type requirements

// let myth: MythicalType = Elf()
// that NEEDS to be able to infer a concrete type at anytime during compilation


// Still can't fiture out the type of food

// A thunk is a helper struct/class that forwards calls from one object to another object. This is useful for scenarios where those two objects can't normally talk to one another. Using this, we can effectively erase our abstract generic protocol types in favor of another concrete, more fully-fledged type. This is often referred to as type erasure.

class AnyMythicalType<T>: MythicalType {
  //These variables are private, preventing others from assigning to them or calling them directly.
  //Since each type is the exact same type as the functions in our MythicalType, we can assign a MythicalType instance's function signatures to these variables.
  //By assigning a MythicalType instance's function signatures to these variables, we can effectively forward any calls made to AnyMythicalType's functions to the original Spaceship instance.
  private let _prepareFood: () -> [T]
  private let _devour: (T) -> Void
  
  //By creating only one required init, we ensure that we can only initialize this class one way.
  required init<U: MythicalType>(mythicalCreature: U) where U.FoodType == T {
    _prepareFood = mythicalCreature.prepareFood
    _devour = mythicalCreature.devour
  }
  
  //Because this forwarding class does conform to the MythicalType protocol, we can call the MythicalType functions directly on this class. This class, as you can see, will forward that message to the function signatures that we assigned at the time of initialization.
  func prepareFood() -> [T] {
    return _prepareFood()
  }
  
  //Here is the second function in the MythicalType protocol and the forwarded message.
  func devour(_ edible: T) {
    _devour(edible)
  }
}

let kraken = Kraken()
let mythicalCreature: AnyMythicalType<Human>
mythicalCreature = AnyMythicalType(mythicalCreature: kraken)
mythicalCreature.prepareFood()

// https://krakendev.io/blog/generic-protocols-and-their-shortcomings



