//
//  HomeStatsView.swift
//  MZCrypto
//
//  Created by Mahmoud Zinji on 2022-07-12.
//

import SwiftUI

struct HomeStatsView: View {

    @EnvironmentObject private var vm: HomeViewModel
    @Binding var showPortfolio: Bool

    var body: some View {
        HStack {
            ForEach(vm.statistics) { stat in
                StatisticView(stat: stat)
                    .frame(width: UIScreen.main.bounds.width / 3)
            }
        }
        .frame(width: UIScreen.main.bounds.width,
               alignment: showPortfolio ? .trailing : .leading
        )
    }
}

struct HomeStatsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeStatsView(showPortfolio: .constant(true))
                .previewLayout(.sizeThatFits)
                .environmentObject(dev.homeVM)

            HomeStatsView(showPortfolio: .constant(false))
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
                .environmentObject(dev.homeVM)
        }
    }
}
