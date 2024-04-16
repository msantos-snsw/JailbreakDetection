//  JailbreakDetection.m
//
//  Copyright (c) 2024 Marlon Santos
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of
//  this software and associated documentation files (the "Software"), to deal in
//  the Software without restriction, including without limitation the rights to
//  use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
//  the Software, and to permit persons to whom the Software is furnished to do so,
//  subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
//  FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
//  COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
//  IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
//  CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//
import UIKit
import Foundation

class DTTJailbreakDetection {
    static func isJailbroken() -> Bool {
#if !(TARGET_IPHONE_SIMULATOR)

        let fileManager = FileManager.default

        if let file = fopen("/Applications/Cydia.app", "r") {
            fclose(file)
            return true
        }
        if let file = fopen("/Library/MobileSubstrate/MobileSubstrate.dylib", "r") {
            fclose(file)
            return true
        }
        if let file = fopen("/bin/bash", "r") {
            fclose(file)
            return true
        }
        if let file = fopen("/usr/sbin/sshd", "r") {
            fclose(file)
            return true
        }
        if let file = fopen("/etc/apt", "r") {
            fclose(file)
            return true
        }
        if let file = fopen("/usr/bin/ssh", "r") {
            fclose(file)
            return true
        }

        if fileManager.fileExists(atPath: "/Applications/Cydia.app") {
            return true
        } else if fileManager.fileExists(atPath: "/Library/MobileSubstrate/MobileSubstrate.dylib") {
            return true
        } else if fileManager.fileExists(atPath: "/bin/bash") {
            return true
        } else if fileManager.fileExists(atPath: "/usr/sbin/sshd") {
            return true
        } else if fileManager.fileExists(atPath: "/etc/apt") {
            return true
        } else if fileManager.fileExists(atPath: "/usr/bin/ssh") {
            return true
        }

        // Check if the app can access outside of its sandbox
        do {
            let string = "."
            try string.write(toFile: "/private/jailbreak.txt", atomically: true, encoding: .utf8)
            try fileManager.removeItem(atPath: "/private/jailbreak.txt")
            return true
        } catch {
            // Ignore the error
        }

        // Check if the app can open a Cydia's URL scheme
        if UIApplication.shared.canOpenURL(URL(string: "cydia://package/com.example.package")!) {
            return true
        }
#endif

        return false
    }
}
