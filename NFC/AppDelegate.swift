//
//  AppDelegate.swift
//  NFC
//
//  Created by Jens Meder on 06.06.17.
//  Copyright © 2017 Jens Meder. All rights reserved.
//

import UIKit
import CoreNFC
import CoreBluetooth

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, NFCNDEFReaderSessionDelegate {

    var window: UIWindow?
    var session: NFCNDEFReaderSession?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.session = NFCNDEFReaderSession(delegate: self, queue: DispatchQueue.global(qos: .background), invalidateAfterFirstRead: false)
            self.session?.begin()
        }
        return true
    }

    
    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
        print(error)
    }
    
    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        print(messages)
    }
}

