//
//  ContentView.swift
//  MakeImageSample
//
//  Created by Taihei Mishima on 2020/10/27.
//  Copyright © 2020 Taihei Mishima. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let cardImage = MakeSampleImage.make()!

    var body: some View {
        Image(uiImage: cardImage)
            .frame(width: cardImage.size.width,
                   height: cardImage.size.height,
                   alignment: .center)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: UIScreen.main.bounds.height, height: UIScreen.main.bounds.width))
    }
}
