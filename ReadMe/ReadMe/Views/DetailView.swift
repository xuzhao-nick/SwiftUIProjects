//
//  DetailView.swift
//  ReadMe
//
//  Created by Nick Xu on 8/11/20.
//

import SwiftUI
import Combine
struct DetailView: View {
  @ObservedObject var book: Book
  @Binding var image: UIImage?
  var body: some View {
    VStack(alignment: .leading) {
      HStack(spacing: 16) {
        BookmarkButton(book: book)
        TitleAndAuthorStack(
          book: book,
          titleFont: .title,
          authorFont: .title2
        )
      }
      ReviewAndImageStack(book: book, image: $image)
    }
    
  }
}

struct DetailView_Previews: PreviewProvider {
  static var previews: some View {
    DetailView(book: .init(), image: .constant(nil))
      .previewedInAllColorSchemes
  }
}


