//
//  ReviewAndImageStack.swift
//  ReadMe
//
//  Created by Nick Xu on 10/11/20.
//

import SwiftUI

struct ReviewAndImageStack: View {
  @ObservedObject var book:Book
  @Binding var image: UIImage?
    var body: some View {
      VStack {
        Divider()
          .padding(.vertical)
        TextField("Review...", text:$book.microReview)
        Divider()
          .padding(.vertical)
      }
      BookImageView(image: $image, book: book)
    }
}

struct ReviewAndImageStack_Previews: PreviewProvider {
    static var previews: some View {
      ReviewAndImageStack(book: .init(), image: .constant(nil))
        .padding()
        .previewedInAllColorSchemes
    }
}
