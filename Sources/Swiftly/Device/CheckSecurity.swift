//
//  CheckSecurity.swift
//  
//
//  Created by Martina D'urso on 01/07/21.
//

import UIKit

open class CheckSecurity {

  static func getPackageName() -> String{
    return Bundle.main.bundleIdentifier ?? "Bundle not found"
  }

  static func isRunningOnEmulator() -> Bool {
    #if targetEnvironment(simulator)
    return true
    #else
    return false
    #endif
  }

  static func isJailbroken() -> Bool {

    guard let cydiaUrlScheme = URL(string: "cydia://package/com.example.package") else { return false }
    if UIApplication.shared.canOpenURL(cydiaUrlScheme as URL) {
      return true
    }

    if isRunningOnEmulator() {return false}

    let fileManager = FileManager.default
    if fileManager.fileExists(atPath: "/Applications/Cydia.app") ||
      fileManager.fileExists(atPath: "/Library/MobileSubstrate/MobileSubstrate.dylib") ||
      fileManager.fileExists(atPath: "/bin/bash") ||
      fileManager.fileExists(atPath: "/usr/sbin/sshd") ||
      fileManager.fileExists(atPath: "/etc/apt") ||
      fileManager.fileExists(atPath: "/usr/bin/ssh") ||
      fileManager.fileExists(atPath: "/private/var/lib/apt") {
      return true
    }

    if canOpen(path: "/Applications/Cydia.app") ||
      canOpen(path: "/Library/MobileSubstrate/MobileSubstrate.dylib") ||
      canOpen(path: "/bin/bash") ||
      canOpen(path: "/usr/sbin/sshd") ||
      canOpen(path: "/etc/apt") ||
      canOpen(path: "/usr/bin/ssh") {
      return true
    }

    let path = "/private/" + NSUUID().uuidString
    do {
      try "anyString".write(toFile: path, atomically: true, encoding: String.Encoding.utf8)
      try fileManager.removeItem(atPath: path)
      return true
    } catch {
      return false
    }
  }

  static func canOpen(path: String) -> Bool {
    let file = fopen(path, "r")
    guard file != nil else { return false }
    fclose(file)
    return true
  }

}
