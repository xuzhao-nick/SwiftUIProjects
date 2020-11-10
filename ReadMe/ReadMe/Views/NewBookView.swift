//
//  AddBookView.swift
//  ReadMe
//
//  Created by Nick Xu on 9/11/20.
//

import SwiftUI

struct NewBookView: View {
  @EnvironmentObject var library: Library
  @ObservedObject var book: Book = Book(title: "", author: "")
  @State var image: UIImage?
  @Environment(\.presentationMode) var presentationMode
  var body: some View {
    NavigationView {
      VStack(spacing:24) {
        TextField("Title", text: $book.title)
        TextField("Author", text:$book.author)
        ReviewAndImageStack(book: book, image: $image)
      }
      .padding()
      .navigationBarTitle("Got a new book?")
      .toolbar {
        ToolbarItem(placement: .status) {
          Button("Add to Library") {
            library.addNewBook(book: book,image:image)
            library.uiImages[book] = image
            self.presentationMode.wrappedValue.dismiss()
          }
          .disabled(
            [book.title, book.author].contains(where: \.isEmpty)
          )
        }
      }
    }
  }
}

struct AddBookView_Previews: PreviewProvider {
  static var previews: some View {
    NewBookView().environmentObject(Library())
  }
}
