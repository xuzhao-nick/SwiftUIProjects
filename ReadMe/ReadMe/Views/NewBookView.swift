//
//  AddBookView.swift
//  ReadMe
//
//  Created by Nick Xu on 9/11/20.
//

import SwiftUI

struct NewBookView: View {
  @State var library: Library
  @ObservedObject var book: Book = Book(title: "", author: "")
  @State var image: UIImage?
  @Environment(\.presentationMode) var presentationMode
  var body: some View {
    VStack(alignment: .leading) {
      Spacer()
      TextField("Title", text: $book.title)
      Spacer()
      TextField("Author", text:$book.author)
      Divider().padding(.vertical)
      ReviewAndImageStack(book: book, image: $image)
      Button(action: {
        library.addBook(book: book)
        library.uiImages[book] = image
        self.presentationMode.wrappedValue.dismiss()
      }, label: {
        Text("Add Book")
      }).disabled(book.title.isEmpty)
    }.padding()
  }
}

struct AddBookView_Previews: PreviewProvider {
  static var previews: some View {
    NewBookView(library: Library())
  }
}
