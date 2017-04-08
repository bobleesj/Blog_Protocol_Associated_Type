//: Reuseable Cell 

import UIKit

protocol ReusableView: class {
  static var defaultReuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
  static var defaultReuseIdentifier: String {
    return String(describing: self)
    //  return String(Self)
  }
}


extension UICollectionViewCell: ReusableView {
}

class newCollectionViewCell: UICollectionViewCell {
  
}


newCollectionViewCell.defaultReuseIdentifier



let BookCell = UICollectionViewCell.defaultReuseIdentifier
print(BookCell)



// identifier = "MyModule.BookCell"



//: Reuseable TableViewCell 


func dequeueReusableCell<T: Reusable>(indexPath indexPath: NSIndexPath) -> T {
  return self.dequeueReusableCellWithIdentifier(T.reuseIdentifier, forIndexPath: indexPath) as! T
}

// T is infered based on `as MyCustomCell`.
let cell = tableView.dequeueReusableCell(indexPath: indexPath) as MyCustomCell




//: The article comes from [Reuseable](https://github.com/AliSoftware/Reusable)

