
import Foundation

UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
UserDefaults.standard.bool(forKey: "isUserLoggedIn")


let key = "isUserLoggedIn"
UserDefaults.standard.set(true, forKey: key)
UserDefaults.standard.bool(forKey: key)


struct Constants {
  struct Account {
    static let isUserLoggedIn = "isUserLoggedIn"
  }
  
}


UserDefaults.standard
  .set(true, forKey: Constants.Account.isUserLoggedIn)
UserDefaults.standard
  .bool(forKey: Constants.Account.isUserLoggedIn)




//: API Goals
// UserDefaults.standard.set(true, forKey: .isUserLoggedIn)

protocol BoolUserDefaultable {
  associatedtype BoolDefaultKey: RawRepresentable
}


extension BoolUserDefaultable where BoolDefaultKey.RawValue == String {
  
  static func set(_ value: Bool, forKey key: BoolDefaultKey) {
    let key = key.rawValue
    UserDefaults.standard.set(value, forKey: key)
  }
  
  static func bool(forKey key: BoolDefaultKey) -> Bool {
    let key = key.rawValue
    return UserDefaults.standard.bool(forKey: key)
  }
  
}


// UserDefaults.set(false, forKey: Aint.Nobody.Got.Time.For.this.rawValue)
extension UserDefaults: BoolUserDefaultable {
  enum BoolDefaultKey: String {
    case isUserLoggedIn
  }
}


// Setter
UserDefaults.set(true, forKey: .isUserLoggedIn)
// Getter
UserDefaults.bool(forKey: .isUserLoggedIn)


struct Account : BoolUserDefaultable {
  enum BoolDefaultKey : String {
    case isUserLoggedIn
  }
  
}

Account.set(true, forKey: .isUserLoggedIn)










