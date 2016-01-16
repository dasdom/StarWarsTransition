# StarWarsTransition
Slide transition for UINavigationController seen in Star Wars films

# Installation
Put the file `DHStarWarsTransition.swift` into your project.

# Usage
## Code
Add a reference to an instance of `NavigationControllerDelegate` to the class that creates the navigation controller (usually this is `AppDelegate`). Create the instance and set the delegate of the navigation controller to that instance. In the demo app, this looks like this:

```swift
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow? = UIWindow(frame: UIScreen.mainScreen().bounds)
  let navigationControllerDelegate = NavigationControllerDelegate()
  
  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    
    let firstViewController = FirstViewController()
    let navigationController = UINavigationController(rootViewController: firstViewController)
    navigationController.delegate = navigationControllerDelegate
    window?.rootViewController = navigationController
    window?.makeKeyAndVisible()
    return true
  }
  
}
```
## Storyboard
Add an Object to the scene with the navigation controller. Set the class of that object to `NavigationControllerDelegate`. Connect the delegate property of the navigation controller with that object.

## Author

Dominik Hauser

dominik.hauser@dasdom.de

[@dasdom](https://twitter.com/dasdom)

## Licence

MIT. See the Licence file for details
