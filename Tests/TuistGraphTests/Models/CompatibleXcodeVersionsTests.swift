import Foundation
import XCTest

@testable import TuistGraph
@testable import TuistSupportTesting

final class CompatibleXcodeVersionsTests: XCTestCase {
    func test_codable_when_all() {
        // Given
        let subject = CompatibleXcodeVersions.all

        // Then
        XCTAssertTrue(subject.isCompatible(versionString: "1"))
        XCTAssertTrue(subject.isCompatible(versionString: "5.5"))
        XCTAssertTrue(subject.isCompatible(versionString: "15.10.10"))
    }

    func test_codable_when_list() {
        // Given
        let subject = CompatibleXcodeVersions.list([.upToNextMajor("13.2.2"), .upToNextMinor("1"), "12.5.1"])

        // Then
        XCTAssertTrue(subject.isCompatible(versionString: "12.5.1"))
        XCTAssertFalse(subject.isCompatible(versionString: "12.5.2"))
        XCTAssertFalse(subject.isCompatible(versionString: "13.2.1"))
        XCTAssertTrue(subject.isCompatible(versionString: "13.2.2"))
        XCTAssertTrue(subject.isCompatible(versionString: "13.3.6"))
        XCTAssertFalse(subject.isCompatible(versionString: "14.2.0"))
        XCTAssertTrue(subject.isCompatible(versionString: "1.0.0"))
        XCTAssertTrue(subject.isCompatible(versionString: "1.0.5"))
        XCTAssertFalse(subject.isCompatible(versionString: "2.0.0"))
    }

    func test_codable_when_exact() {
        // Given
        let subject = CompatibleXcodeVersions.exact("13.2")

        // Then
        XCTAssertTrue(subject.isCompatible(versionString: "13.2"))
        XCTAssertTrue(subject.isCompatible(versionString: "13.2.0"))
        XCTAssertFalse(subject.isCompatible(versionString: "13.2.2"))
        XCTAssertFalse(subject.isCompatible(versionString: "13.3.0"))
        XCTAssertFalse(subject.isCompatible(versionString: "14.2.0"))
    }

    func test_codable_when_upToNextMajor() {
        // Given
        let subject = CompatibleXcodeVersions.upToNextMajor("13.2")

        // Then
        XCTAssertTrue(subject.isCompatible(versionString: "13.2"))
        XCTAssertTrue(subject.isCompatible(versionString: "13.2.0"))
        XCTAssertTrue(subject.isCompatible(versionString: "13.2.2"))
        XCTAssertTrue(subject.isCompatible(versionString: "13.3.0"))
        XCTAssertFalse(subject.isCompatible(versionString: "14.2.0"))
    }

    func test_codable_when_upToNextMinor() {
        // Given
        let subject = CompatibleXcodeVersions.upToNextMinor("13.2")

        // Then
        XCTAssertTrue(subject.isCompatible(versionString: "13.2"))
        XCTAssertTrue(subject.isCompatible(versionString: "13.2.0"))
        XCTAssertTrue(subject.isCompatible(versionString: "13.2.2"))
        XCTAssertFalse(subject.isCompatible(versionString: "13.3.0"))
        XCTAssertFalse(subject.isCompatible(versionString: "14.2.0"))
    }
}