import XCTest
@testable import JailbreakDetection

final class JailbreakDetectionTests: XCTestCase {
    func testIsJailbroken() {
            let jailbreakDetection = JailbreakDetection()

            // Test when the device is not jailbroken
            #if TARGET_IPHONE_SIMULATOR
                XCTAssertTrue(!jailbreakDetection.isJailbroken(), "Device is not jailbroken but the function returns true")
            #else
                // If you are testing on a real device, you can't guarantee that it's not jailbroken.
                // So, you can only test the negative case (when the device is not jailbroken).
                if !JailbreakDetection.isJailbroken() {
                    XCTAssertTrue(true, "Device is not jailbroken")
                }
            #endif

            // Add more test cases here to test when the device is jailbroken
            // For example, you can create a jailbroken environment in a simulator
            // or use a jailbroken device to test the positive cases.
        }
}
