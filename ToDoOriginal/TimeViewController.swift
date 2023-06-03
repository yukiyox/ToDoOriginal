//
//  TimeViewController.swift
//  ToDoOriginal
//
//  Created by Yukiyo Suenaga on 2023/05/30.
//

import UIKit
class TimeViewController: UIViewController {
    extension TimeViewController: UNUserNotificationCenterDelegate {
    
        func userNotificationCenter(
            _ center: UNUserNotificationCenter,
            willPresent notification: UNNotification,
            withCompletionHandler completionHandler: @escaping (_ options: UNNotificationPresentationOptions) -> Void
        ) {
           
            completionHandler([.banner, .list, .sound, .badge])
        }
        
    
    func showPushPermit(completion: @escaping (Result<Bool, Error>) -> Void) {
        
            center.requestAuthorization(options: [.alert, .badge, .sound]) { isGranted, error in
                if let error = error {
                    debugPrint(error.localizedDescription)
                    completion(.failure(error))
                    return
                }
                completion(.success(isGranted))
            }
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var shared = TimeViewController()
        var center = UNUserNotificationCenter.current()
        
        func initialize() {
            center.delegate = TimeViewController.shared
        }
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ){
        guard let _ = (scene as? UIWindowScene) else { return }
        
        
        TimeViewController.shared.initialize()
    
        
        
        func userNotificationCenter(
             _ center: UNUserNotificationCenter,
             didReceive response: UNNotificationResponse,
             withCompletionHandler completionHandler: @escaping () -> Void
         ) {
             completionHandler()
         }
        
        UNCalendarNotificationTrigger(dateMatching: DateComponents, repeats: true)
     }
        
    }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
