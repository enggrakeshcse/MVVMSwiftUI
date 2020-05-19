

import Foundation
import SwiftUI

struct URLImages {

    init() {
        self.placeholder = Image(systemName: "photo")
        self.imageLoader = ImageLoader()
    }

    @ObservedObject var imageLoader: ImageLoader

    var placeholder: Image

    var body: some View {
        imageLoader.image == nil ?
            placeholder : Image(uiImage: imageLoader.image!)
    }
}
