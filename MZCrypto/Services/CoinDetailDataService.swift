//
//  CoinDetailDataService.swift
//  MZCrypto
//
//  Created by Mahmoud Zinji on 2022-08-23.
//

import Foundation
import Combine

class CoinDetailDataService {

    @Published var coinDetails: CoinDetailModel? = nil

    var coinDetailsSubscription: AnyCancellable?
    let coin: CoinModel

    init(coin: CoinModel) {
        self.coin = coin
        getCoinDetails()
    }

    func getCoinDetails() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/\(coin.id)?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false") else { return }

        coinDetailsSubscription = NetworkingManager.download(url: url)
            .decode(type: CoinDetailModel.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnedCoinDetails in
                self?.coinDetails = returnedCoinDetails
                self?.coinDetailsSubscription?.cancel()
            })
    }
}
