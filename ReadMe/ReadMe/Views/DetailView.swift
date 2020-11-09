//
//  DetailView.swift
//  ReadMe
//
//  Created by Nick Xu on 8/11/20.
//
import class PhotosUI.PHPickerViewController
import SwiftUI
import Combine
struct DetailView: View {
  @ObservedObject var book: Book
  @Binding var image: UIImage?
  @State var showingImagePicker = false
  @State var showingDeleteImageAlert = false
  
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
      
      VStack {
        Divider()
          .padding(.vertical)
        TextField("Review...", text:$book.microReview)
        Divider()
          .padding(.vertical)
        Book.Image(
          uiImage: image,
          title: book.title,
          cornerRadius: 16
        ).padding()
        HStack {
          Spacer()
          if image != nil {
            Button("Delete Image") {
              showingDeleteImageAlert = true
            }
            Spacer()
          }
          
          Button("Update Image...") {
            showingImagePicker = true
          }
          .padding()
          Spacer()
        }

        
      }
      Spacer()
    }
    .padding()
    .sheet(isPresented: $showingImagePicker) {
      PHPickerViewController.View(image: $image)
    }.alert(isPresented: $showingDeleteImageAlert) {
      .init(title: .init("Delete image for \(book.title)?"),
            primaryButton: .destructive(.init("Delete")){
              image = nil
            },
            secondaryButton: .cancel())
    }
  }
}

struct DetailView_Previews: PreviewProvider {
  static var previews: some View {
    DetailView(book: .init(), image: .constant(nil))
      .previewedInAllColorSchemes
  }
}
