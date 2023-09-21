//
//  MyStoreView.swift
//  RateYourCharge
//
//  Created by Jin on 9/13/23.
//

import SwiftUI
import StoreKit

@available(iOS 17.0, *)
public struct MyStoreView: View {
    let groupID: String
    
    public init(groupID: String) {
        self.groupID = groupID
    }
    
    public var body: some View {
        SubscriptionStoreView(groupID: groupID)
            .subscriptionStoreButtonLabel(.multiline)
            .storeButton(.visible, for:
                    .policies, .restorePurchases, .redeemCode
            )
            .onAppear {
//                MyAnalytics.view(self)
            }

    }
}

#Preview {
    if #available(iOS 17.0, *) {
        MyStoreView(groupID: "21388021")
    } else {
        EmptyView()
    }
}
