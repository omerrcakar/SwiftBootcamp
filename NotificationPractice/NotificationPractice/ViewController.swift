//
//  ViewController.swift
//  NotificationPractice
//
//  Created by ÖMER  on 12.03.2025.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    
    var izinKontrol = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UNUserNotificationCenter.current().delegate = self
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            
            self.izinKontrol = granted
            
            if granted{
                print("İzin alma başarılı")
            }else{
                print("İzin alma başarısız")
            }
        }
        
    }

    @IBAction func buttonBildirimOlustur(_ sender: UIButton) {
        if izinKontrol{
            let icerik = UNMutableNotificationContent()
            icerik.title = "Başlık"
            icerik.subtitle = "Alt Başlık"
            icerik.body = "Bildirim içeriği"
            icerik.badge = 1
            icerik.sound = UNNotificationSound.default
            
            let tigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            
            let bildirimIstek = UNNotificationRequest(identifier: "id", content: icerik, trigger: tigger)
            UNUserNotificationCenter.current().add(bildirimIstek)
        }
    }
    
}


extension ViewController : UNUserNotificationCenterDelegate{
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .sound, .badge])
    }
    
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        center.setBadgeCount(0)
        completionHandler()
    }
}

