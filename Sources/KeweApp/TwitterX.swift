//
//  TwitterX.swift
//  RateYourCharge
//
//  Created by Jin on 8/8/23.
//

import Foundation
import SwiftUI

func send(tweet: String) {
    // Perform form submission logic here
    
    
    let encodedTweet = tweet.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
//        let encodedUrl = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!

    let twitterURL = URL(string: "twitter://post?message=\(encodedTweet)")! // &url=\(encodedUrl)
    
    if UIApplication.shared.canOpenURL(twitterURL) {
        UIApplication.shared.open(twitterURL)
    } else {
        let webURL = URL(string: "https://twitter.com/intent/tweet?text=\(encodedTweet)")!
        UIApplication.shared.open(webURL)
    }

}
