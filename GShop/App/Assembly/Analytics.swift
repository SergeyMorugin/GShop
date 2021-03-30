//
//  Analytic.swift
//  GShop
//
//  Created by Matthew on 27.03.2021.
//  Copyright © 2021 Ostagram Inc. All rights reserved.
//

import Foundation
import FirebaseAnalytics


protocol AnalyticsService {
    func successLogIn()
    func failureLogIn()
    func signOut()
    func showItemsList()
    func showItemPage(_ itemId: Int)
    func addItemToCart(_ itemId: Int)
    func deleteItemFromCart(_ itemId: Int)
    func cartCheckout(_ cart: Cart)
    func addReview(_ review: Review) 
}

class GoogleAnalitics: AnalyticsService {
    func successLogIn() {
        Analytics.logEvent(AnalyticsEventLogin, parameters: ["status": "success"])
    }
    
    func failureLogIn() {
        Analytics.logEvent(AnalyticsEventLogin, parameters: ["status": "failure"])
    }
    
    func signOut() {
        Analytics.logEvent("signout", parameters: [:])
    }
    
    func showItemsList() {
        Analytics.logEvent(AnalyticsEventViewItemList, parameters: [:])
    }
    
    func showItemPage(_ itemId: Int) {
        Analytics.logEvent(AnalyticsEventViewItem, parameters: [AnalyticsParameterItemID: itemId])
    }
    
    func addItemToCart(_ itemId: Int) {
        Analytics.logEvent(AnalyticsEventAddToCart, parameters: [AnalyticsParameterItemID: itemId])
    }
    
    func deleteItemFromCart(_ itemId: Int) {
        Analytics.logEvent(AnalyticsEventRemoveFromCart, parameters: [AnalyticsParameterItemID: itemId])
    }
    
    func cartCheckout(_ cart: Cart) {
        Analytics.logEvent(
            AnalyticsEventPurchase,
            parameters: [
                AnalyticsParameterValue: cart.totalPrice,
                AnalyticsParameterItems: [cart.items.map({$0.product.id})],
                AnalyticsParameterCurrency: "USD"
            ]
        )
    }
    
    func addReview(_ review: Review) {
        Analytics.logEvent(AnalyticsEventPostScore, parameters: [
            "user_id": review.userId,
            "text": review.text
        ])
    }

}
