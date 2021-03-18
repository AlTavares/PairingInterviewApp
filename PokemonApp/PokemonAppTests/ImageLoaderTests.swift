@testable import PokemonApp
import XCTest

class ImageLoaderTests: XCTestCase {
    func testExample() throws {
        let imageLoader = ImageLoader()
        let imageView = UIImageView()
        
        imageLoader.loadImage(from: octocat.remoteUrl, to: imageView)
        
        // Image was loaded
        XCTAssertNotNil(imageView.image)
        
        // Image is the same as expected
        XCTAssertEqual(imageView.image?.pngData(), octocat.localImage?.pngData())
    }
}

let octocat = (
    remoteUrl: "https://avatars.githubusercontent.com/u/583231?s=460&u=a59fef2a493e2b67dd13754231daf220c82ba84d&v=4",
    localImage: UIImage(named: "octocat.png", in: Bundle(for: ImageLoaderTests.self), with: nil)
)
