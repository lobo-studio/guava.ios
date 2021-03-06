//
//  CardsController.swift
//  Goyava
//
//  Created by Susim Samanta on 04/04/16.
//  Copyright © 2016 LordAlexWorks. All rights reserved.
//

import UIKit
import RealmSwift
public typealias CardsHandler = (obj : AnyObject? , error : NSError?) -> Void

class CardsController: NSObject {
    //get all cards from current session
    class func getAllCards(handler : CardsHandler) {
        let user = User()
        AppServices.getAllCardsOfUser(user) { (obj, error) in
            if error != nil {
                handler(obj: nil, error: error)
            }else {
                //parse card object
                let json = obj as! NSDictionary
                let cards = json["cards"] as! NSArray
                handler(obj: self.getMyCards(cards), error: nil)
            }
        }
    }
    class func getMyCards(cards : NSArray) -> List<Card> {
        let cardsList = List<Card>()
        for item in cards {
            let card = Card()
            card.setModelData(item as! NSDictionary)
            cardsList.append(card)
        }
        return cardsList
    }
    class func getMyShop(shopDict : NSDictionary)-> Shop {
        let shop = Shop()
        shop.setModelData(shopDict)
        return shop
    }
}
