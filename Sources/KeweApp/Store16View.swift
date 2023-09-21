//
//  Store16View.swift
//  RateYourCharge
//
//  Created by Jin on 9/19/23.
//

import SwiftUI

public struct Store16View: View {
    let groupID: String
    
    public init(groupID: String) {
        self.groupID = groupID
    }
    
    public var body: some View {
        if #available(iOS 17.0, *) {
            MyStoreView(groupID: groupID)
        } else {
            Text("You need iOS 17 and iPhone Xs or later to access the store.")
        }
    }
}

#Preview {
    Store16View(groupID: "21388021")
}
