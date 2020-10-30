import XCTest
@testable import GoogleSignIn

final class GoogleSignInTests: XCTestCase {
    func testExample() {
        let instance = GIDSignIn.sharedInstance()
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        // XCTAssertEqual(GoogleSignIn().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
