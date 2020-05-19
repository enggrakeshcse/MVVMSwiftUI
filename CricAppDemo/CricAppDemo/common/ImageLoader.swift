
import SwiftUI
import Combine

enum ImageURLError: Error {
    case dataIsNotAnImage
}

class ImageLoader: ObservableObject {

    let id: String = UUID().uuidString
    var didChange = PassthroughSubject<Void, Never>()

    var image: UIImage? {
        didSet {
            DispatchQueue.main.async {
                self.didChange.send()
            }
        }
    }

    func load(url: URL) {
        print(#function)
        self.image = nil

        URLSession.shared.dataTask(with: url) { (data, res, error) in
            guard error == nil else {
                return
            }

            guard
                let data = data,
                let image = UIImage(data: data)
            else {
                return
            }

            self.image = image
        }.resume()
    }

}
