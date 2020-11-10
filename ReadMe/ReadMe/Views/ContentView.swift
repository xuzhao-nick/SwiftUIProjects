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
        switch library.sortStyle {
        case .title, .author:
          BookRows(books: library.sortedBooks, section: nil)
        case .manual:
          SectionRows()
        }

        
//        ForEach(library.sortedBooks) { book in
//          BookRow(book: book)
//        }
      }
      .toolbar{
        ToolbarItem(placement: .navigationBarLeading) {
          Menu("Sort") {
            Picker("Sort Style", selection: $library.sortStyle) {
              ForEach(SortStyle.allCases, id: \.self) { sortStyle in
                Text("\(sortStyle)".capitalized)
              }
            }
          }
        }
        ToolbarItem(content: EditButton.init)
    }
      .navigationBarTitle("My Library")
    }.sheet(isPresented: $addingNewBook) {
      NewBookView()
    }
    
  }
}

private struct SectionRows: View {
  @EnvironmentObject var library: Library
  var body: some View {
    ForEach(Section.allCases, id: \.self) {
      SectionView(section: $0)
    }
  }
}


private struct BookRows: View {
  let books: [Book]
  let section: Section?
  @EnvironmentObject var library: Library
  var body: some View {
    ForEach(books) {
      BookRow(book: $0)
    }
    .onDelete { indexSet in
      library.deleteBooks(atOffsets: indexSet, section: section)
    }
    .onMove { indices, newOffset in
      library.moveBooks(
        oldOffsets: indices, newOffset: newOffset,
        section: section!
      )
    }.moveDisabled(section == .none)
  }
}


private struct BookRow: View {
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

private struct SectionView: View {
  let section: Section
  @EnvironmentObject var library: Library
  
  var title: String {
    switch section {
    case .readMe:
      return "Read Me!"
    case .finished:
      return "Finished!"
    }
  }
  
  
  var body: some View {
    if let books = library.manuallySortedBooks[section] {
      SwiftUI.Section(
        header:
          ZStack {
            Image("BookTexture")
            .resizable()
            .scaledToFit()
            Text(title)
              .font(.custom("American Typewriter", size: 24))
          }
          .listRowInsets(.init())
      ) {
        BookRows(books: books, section: section)
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView().environmentObject(Library())
      .previewedInAllColorSchemes
  }
}



