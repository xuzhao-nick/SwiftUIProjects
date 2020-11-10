//
//  AddBookView.swift
//  ReadMe
//
//  Created by Nick Xu on 9/11/20.
//

import SwiftUI

struct NewBookView: View {
  @State var library: Library
  @ObservedObject var book = Book(title:"", author:"")
  @State var image: UIImage?
  @Environment(\.presentationMode) var presentationMode
  var body: some View {
    VStack(alignment: .leading) {
      Spacer()
      TextField("Title", text: $book.title)
      Spacer()
      TextField("Author", text:$author)
      Divider().padding(.vertical)
      TextField("Review...", text:$microReview)
      Divider().padding(.vertical)
      BookImageView(image: $image, book: book)
      Button(action: {
        book.title = title
        book.author = author
        book.microReview = microReview
        library.addBook(book: book)
        library.uiImages[book] = image
        self.presentationMode.wrappedValue.dismiss()
      }, label: {
        Text("Add Book")
      }).disabled(title.isEmpty)
    }.padding()
  }
}

struct AddBookView_Previews: PreviewProvider {
  static var previews: some View {
    NewBookView(library: Library())
  }
}
