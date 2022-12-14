//
//  CoinImageView.swift
//  MZCrypto
//
//  Created by Mahmoud Zinji on 2022-07-12.
//

import SwiftUI

struct CoinImageView: View {

    @StateObject var vm: CoinImageViewModel

    init(coin: CoinModel) {
        _vm = StateObject(wrappedValue: CoinImageViewModel(coin: coin))
    }

    var body: some View {
        ZStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else if vm.isLoading {
                ProgressView()
            } else {
                Image(systemName: "questionmark")
                    .foregroundColor(Color.theme.secondaryText)
            }
        }
    }
}

struct CoinImageView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CoinImageView(coin: dev.coin)
                .padding()
                .previewLayout(.sizeThatFits)

            CoinImageView(coin: dev.coin)
                .padding()
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}
