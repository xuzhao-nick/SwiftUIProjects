//
//  BookImageView.swift
//  ReadMe
//
//  Created by Nick Xu on 10/11/20.
//

import SwiftUI
import class PhotosUI.PHPickerViewController
struct BookImageView: View {
  @Binding var image: UIImage?
  let book: Book
  @State var showingImagePicker = false
  @State var showingDeleteImageAlert = false
  var body: some View {
    VStack{
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
      Spacer()
      
    }.padding()
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

struct BookImageView_Previews: PreviewProvider {
    static var previews: some View {
      BookImageView(image: .constant(nil), book: .init())
    }
}
