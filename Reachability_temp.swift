//
//  Reachability.swift
//  Mfactory2
//
//  Created by Павел Ларичев on 08.10.2021.
//


import UIKit

class ViewController: UIViewController {
    
//    var reachability: Reachability?
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        stopNotifier()
//        setupReachability("google.com", useClosures: false)
//        startNotifier()
//    }
//
//    
//    func setupReachability(_ hostName: String?, useClosures: Bool) {
//        let reachability: Reachability?
//        if let hostName = hostName {
//            reachability = try? Reachability(hostname: hostName)
//        } else {
//            reachability = try? Reachability()
//        }
//        self.reachability = reachability
//
//        NotificationCenter.default.addObserver(
//            self,
//            selector: #selector(reachabilityChanged(_:)),
//            name: .reachabilityChanged,
//            object: reachability
//        )
//        
//    }
//    
//    func startNotifier() {
//        print("--- start notifier")
//        do {
//            try reachability?.startNotifier()
//        } catch {
////            networkStatus.textColor = .red
////            networkStatus.text = "Unable to start\nnotifier"
//            return
//        }
//    }
//    
//    func stopNotifier() {
//        print("--- stop notifier")
//        reachability?.stopNotifier()
//        NotificationCenter.default.removeObserver(self, name: .reachabilityChanged, object: nil)
//        reachability = nil
//    }
//
//    @objc func reachabilityChanged(_ note: Notification) {
//        let reachability = note.object as! Reachability
//        
//
//    }
    
    
//    func anyTapped() {
//        if reachability?.connection == .unavailable || reachability?.connection == .none {
//            print("Алерт СУКА!!!!")
//        } else {
//
//        }
//    }
//    deinit {
//        stopNotifier()
//    }
}

