import XCTest
import MultipartFormDataParser

#if canImport(Cocoa)
import Cocoa

final class MultipartFormDataParser_CocoaTests: XCTestCase {

    override class func setUp() {
        stubForUpload()
    }

    override class func tearDown() {
        clearStubs()
    }

    func testAlamofire() throws {
        let genbaNeko = try XCTUnwrap(NSImage(data: TestResource.genbaNeko)?.jpegRepresentation)
        let denwaNeko = try XCTUnwrap(NSImage(data: TestResource.denwaNeko)?.jpegRepresentation)
        let message = try XCTUnwrap("Hello world!".data(using: .utf8))

        let result = try XCTUnwrap(uploadWithAlamoFire(genbaNeko: genbaNeko, denwaNeko: denwaNeko, message: message))
        XCTAssertEqual(result.status, 200)
        XCTAssertNil(result.error)
    }

    func testAPIKit() throws {
        let genbaNeko = try XCTUnwrap(NSImage(data: TestResource.genbaNeko)?.jpegRepresentation)
        let denwaNeko = try XCTUnwrap(NSImage(data: TestResource.denwaNeko)?.jpegRepresentation)
        let message = try XCTUnwrap("Hello world!".data(using: .utf8))

        let result = try XCTUnwrap(uploadWithAPIKit(genbaNeko: genbaNeko, denwaNeko: denwaNeko, message: message))
        XCTAssertEqual(result.status, 200)
        XCTAssertNil(result.error)
    }

    func testMoya() throws {
        let genbaNeko = try XCTUnwrap(NSImage(data: TestResource.genbaNeko)?.jpegRepresentation)
        let denwaNeko = try XCTUnwrap(NSImage(data: TestResource.denwaNeko)?.jpegRepresentation)
        let message = try XCTUnwrap("Hello world!".data(using: .utf8))

        let result = try XCTUnwrap(uploadWithMoya(genbaNeko: genbaNeko, denwaNeko: denwaNeko, message: message))
        XCTAssertEqual(result.status, 200)
        XCTAssertNil(result.error)
    }
}
#endif
