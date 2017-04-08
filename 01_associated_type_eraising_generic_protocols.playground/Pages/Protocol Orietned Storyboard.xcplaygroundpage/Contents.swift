
import UIKit

extension UIStoryboard {
  enum Storyboard: String {
    case main
    case news
    case gallery
    var filename: String {
      return rawValue.capitalized
    }
  }
}


// This code will compile and run without any hassles, but the syntax is quite ugly. So let’s take this further even further and reduce our syntax by creating our own convenience initializer
// let storyboard = UIStoryboard(name: UIStoryboard.Storyboard.news.filename, bundle: nil)


convenience init(storyboard: Storyboard, bundle: Bundle? = nil) {
  self.init(name: storyboard.filename, bundle: bundle)
}

let storyboard = UIStoryboard(storyboard: .news)

// Alternative to Convenience Init
class func storyboard(storyboard: Storyboard, bundle: Bundle? = nil) -> UIStoryboard {
  return UIStoryboard(name: storyboard.filename, bundle: bundle)
}

let storyboard = UIStoryboard.storyboard(.news)

//  I guess the only difference is personal taste over syntax style, in my opinion I think the class functions look nicer, so I tend to use them in my own code. Whatever you choice is, just make sure it’s uniform throughout your project.

protocol StoryboardIdentifiable {
  static var storyboardIdentifier: String { get }
}

extension StoryboardIdentifiable where Self: UIViewController {
  static var storyboardIdentifier: String {
    return String(describing: self)
  }
}

extension UIViewController: StoryboardIdentifiable { }

class ArticleViewController: UIViewController { }
print(ArticleViewController.storyboardIdentifier)


func instantiateViewController<T: UIViewController>() -> T where T: StoryboardIdentifiable {
  
  guard let viewController = self.instantiateViewController(withIdentifier: T.storyboardIdentifier) as? T else {
    fatalError("Couldn't instantiate view controller with identifier \(T.storyboardIdentifier) ")
  }
  
  return viewController
}



// We’re using generics here which only allow us to pass in classes that are either UIViewController or subclasses of, and there’s also a where statement included in the generics declaration that limit the compatible arguments to those classes that conform to the StoryboardIdentifiable protocol.


// If we tried passing in an NSObject, Xcode wouldn’t compile. Or if we tried passing in a UIViewController that didn’t conform to the StoryboardIdentifiable protocol, that too would stop Xcode from compiling. Already this is much safer. #winning.


class ArticleViewController: UIViewController
{
  func printHeadline() { }
}
...
let storyboard = UIStoryboard.storyboard(.news)
let viewController: ArticleViewController = storyboard.instantiateViewController()
viewController.printHeadline()
presentViewController(viewController, animated: true, completion: nil)









