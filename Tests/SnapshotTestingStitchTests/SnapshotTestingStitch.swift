import XCTest
import SnapshotTesting
@testable import SnapshotTestingStitch

final class SnapshotTestingStitchTests: XCTestCase {
    
    let isRecording: Bool = false
    
    func test_withTitles() {
        assertSnapshot(
            matching: createTestViewController(),
            as: .stitch(
                strategies: [
                    ("iPhone 8", .image(on: .iPhone8)),
                    ("iPhone 8 Plus", .image(on: .iPhone8Plus)),
                ]
            ),
            record: isRecording
        )
    }
    
    func test_withoutTitles() {
        assertSnapshot(
            matching: createTestViewController(),
            as: .stitch(
                strategies: [
                    .image(on: .iPhone8),
                    .image(on: .iPhone8Plus),
                ]
            ),
            record: isRecording
        )
    }
    
    func test_withoutBorder() {
        assertSnapshot(
            matching: createTestViewController(),
            as: .stitch(
                strategies: [
                    ("iPhone 8", .image(on: .iPhone8)),
                    ("iPhone 8 Plus", .image(on: .iPhone8Plus)),
                ],
                style: .init(borderWidth: 0)
            ),
            record: isRecording
        )
    }
    
    func test_withManyDevices() {
        assertSnapshot(
            matching: createTestViewController(),
            as: .stitch(
                strategies: [
                    ("iPhone 8", .image(on: .iPhone8)),
                    ("iPhone 8 Plus", .image(on: .iPhone8Plus)),
                    ("iPhone X", .image(on: .iPhoneX)),
                    ("iPhone SE", .image(on: .iPhoneSe)),
                    ("iPhone Xr", .image(on: .iPhoneXr)),
                    ("iPhone Xs Max", .image(on: .iPhoneXsMax)),
                    ("iPhone Xs Max (Landscape)", .image(on: .iPhoneXsMax(.landscape))),
                ]
            ),
            record: isRecording
        )
    }
    
    // MARK: - Helpers
    
    func createTestViewController() -> UIViewController {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .blue
        
        return viewController
    }
    
}
