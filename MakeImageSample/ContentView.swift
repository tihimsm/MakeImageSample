//
//  ContentView.swift
//  MakeImageSample
//
//  Created by Taihei Mishima on 2020/10/27.
//  Copyright © 2020 Taihei Mishima. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("QRCode").font(.largeTitle).padding(20)
            Image(uiImage: UIImage.makeQRCode(text: "sample")!)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
