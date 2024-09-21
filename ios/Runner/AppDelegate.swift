// import Flutter
// import UIKit

// @UIApplicationMain
// @objc class AppDelegate: FlutterAppDelegate {
//   override func application(
//     _ application: UIApplication,
//     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
//   ) -> Bool {
//     GeneratedPluginRegistrant.register(with: self)
//     return super.application(application, didFinishLaunchingWithOptions: launchOptions)
//   }
// }

import UIKit
import Flutter
import GoogleMaps


@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GMSServices.provideAPIKey("AIzaSyCksF0hB_baN9JpQ_RLqvNqRgOMB-ID0cU")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}





// import UIKit
// import Flutter
// import GoogleMaps


// @UIApplicationMain
// @objc class AppDelegate: FlutterAppDelegate, MessagingDelegate {
//     override func application(
//         _ application: UIApplication,
//         didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
//     ) -> Bool {
        

//                                 // TODO: Add your API key
//         GMSServices.provideAPIKey("AIzaSyCksF0hB_baN9JpQ_RLqvNqRgOMB-ID0cU")
        

        
//         GeneratedPluginRegistrant.register(with: self)
//         return super.application(application, didFinishLaunchingWithOptions: launchOptions)
//     }
    
    

// }