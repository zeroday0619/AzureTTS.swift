//
// Created by zeroday0619 on 22. 8. 12.
//

import Foundation


public func getEnvironmentVariables(name: String) -> String? {
    guard let rawValue = getenv(name) else { return nil }
    return String(utf8String: rawValue)
}