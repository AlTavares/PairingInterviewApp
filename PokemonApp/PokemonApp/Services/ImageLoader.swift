import UIKit

class ImageLoader {
    func loadImage(from origin: String, to imageView: UIImageView) {
        let url = URL(string: origin)!
        let data = try! Data(contentsOf: url)
        let image = UIImage(data: data)
        imageView.image = image
    }
}
