//
//  ContentView.swift
//  ReadMe
//
//  Created by Nick Xu on 4/11/20.
//

import SwiftUI

struct ContentView: View {
  @State var library = Library()
  @State var showingAddNewBook = false
  var body: some View {
    NavigationView {
      List {
        Button{
          showingAddNewBook = true
        } label: {
          Spacer()
          
          VStack(spacing: 6) {
            Image(systemName: "book.circle")
              .font(.system(size:60))
            Text("Add New Book")
              .font(.title2)
          }
          
          Spacer()
        }
        .buttonStyle(BorderlessButtonStyle())
        
        ForEach(library.sortedBooks) { book in
          BookRow(
            book: book,
            image: $library.uiImages[book]
          )
        }
      }
      .navigationBarTitle("My Library")
    }.sheet(isPresented: $showingAddNewBook) {
      NewBookView(library: library)
    }
    
  }
}



struct BookRow: View {
  @ObservedObject var book:Book
  @Binding var image: UIImage?
  var body: some View {
    NavigationLink(
      destination: DetailView(book: book, image: $image)
    ) {
      HStack {
        Book.Image(
          uiImage: image,
          title: book.title,
          size:80.0,
          cornerRadius: 12
        )
        VStack(alignment: .leading) {
          TitleAndAuthorStack(
            book: book,
            titleFont: .title2,
            authorFont: .title3
          )
          if !book.microReview.isEmpty {
            Spacer()
            Text(book.microReview)
              .font(.subheadline)
              .foregroundColor(.secondary)
          }

        }
        .lineLimit(1)
        Spacer()
        BookmarkButton(book: book)
          .buttonStyle(BorderlessButtonStyle())
        
      }
      .padding(.vertical, 8)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .previewedInAllColorSchemes
  }
}



