//
//  ContentView.swift
//  AsyncImage
//
//  Created by Sinan Kara on 3.12.2021.
//

import SwiftUI

struct ContentView: View {
    
    let url = URL(string: "https://images.unsplash.com/flagged/1/apple-gear-looking-pretty.jpg?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80")
    let url2 = URL(string: "https://picsum.photos/300/340")
    
    var body: some View {
        ScrollView {
            
            // normal kullanim hali
            AsyncImage(url: url2).cornerRadius(10)
            Divider()
            
            
            /* resize yapabilmek icin, we placeholder kullanabilmek icin
            // we resizing as we need, thus we used
            AsyncImage(url: <#T##URL?#>, content: <#T##(Image) -> View#>, placeholder: <#T##() -> View#>)
            */
            AsyncImage(url: url2) { returnedImage in
                returnedImage
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200, alignment: .center)
            } placeholder: {
                ProgressView()
            }
            
            
            Divider()
            // AsyncImagePhase
            AsyncImage(url: url2) { asyncImagePhase in
                switch asyncImagePhase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150, alignment: .center)
                case .failure:
                    Image(systemName: "questionmark").font(.headline)
                @unknown default:
                    Image(systemName: "questionmark").font(.headline)
                }
            }

        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
