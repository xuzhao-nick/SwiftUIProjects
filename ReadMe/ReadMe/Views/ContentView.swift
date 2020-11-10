//
//  ContentView.swift
//  ReadMe
//
//  Created by Nick Xu on 4/11/20.
//

import SwiftUI

struct ContentView: View {
  @EnvironmentObject var library:Library
  @State var addingNewBook = false
  var body: some View {
    NavigationView {
      List {
        Button{
          addingNewBook = true
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
          BookRow(book: book)
        }
      }
      .navigationBarTitle("My Library")
    }.sheet(isPresented: $addingNewBook) {
      NewBookView()
    }
    
  }
}



struct BookRow: View {
  @ObservedObject var book:Book
  @EnvironmentObject var library:Library
  var body: some View {
    NavigationLink(
      destination: DetailView(book: book).environmentObject(library)
    ) {
      HStack {
        Book.Image(
          uiImage: library.uiImages[book],
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
    ContentView().environmentObject(Library())
      .previewedInAllColorSchemes
  }
}



