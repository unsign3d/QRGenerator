//
//  ContentView.swift
//  QR generator
//
//  Created by lbruzzone on 26.11.20.
//

import SwiftUI

struct ContentView: View {
  
  @ObservedObject var model = QRViewModel()
  
  var body: some View {
    HStack {
      VStack {
        Text("Create QR codes").font(.title)
        TextEditor(text: $model.text)
        Button(action: {
          model.saveImage()
        }) {
          Text("Save image")
        }
      }
      .frame(minWidth: 250, maxWidth: .infinity, minHeight: 250,
        maxHeight: .infinity, alignment: .topLeading)
      Image(decorative: model.generateImage()!, scale: 2.5, orientation: Image.Orientation.up)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView()
    }
}
