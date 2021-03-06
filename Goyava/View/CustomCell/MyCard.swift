//
//  MyCard.swift
//  Guava
//
//  Created by Susim Samanta on 10/02/16.
//  Copyright © 2016 LordAlexWorks. All rights reserved.
//

import UIKit

class MyCard: UIView {
    
    @IBOutlet weak var iconImageView :  UIImageView!
    @IBOutlet weak var globalPointLabel : UILabel!
    @IBOutlet weak var weeklyPointLabel : UILabel!
    @IBOutlet weak var backgroundCicularview : UIView!
    
    var card: Card?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "MyCard", bundle: nil).instantiateWithOwner(nil, options: nil)[0] as! UIView
    }

    override func layoutSubviews(){
        if iconImageView != nil {
            print(frame, terminator: "")
            backgroundCicularview.frame = CGRect(x: (frame.size.width-frame.size.height)/2+5, y: 0, width: frame.size.height-35, height: frame.size.height-35)
            globalPointLabel.frame = CGRect(x: 0, y: frame.size.height-35, width: frame.size.width, height: 15)
            weeklyPointLabel.frame = CGRect(x: 0, y: frame.size.height-20, width: frame.size.width, height: 10)
            
            let maxPoints = Double(self.card!.maxPoint)
            let globalPoints = Double(ActivitiesController.getGlobalPoint(self.card!))
            let totalProgress = globalPoints/maxPoints
            CircleView.drawCircleOn(backgroundCicularview, color: UIColor.grayColor(), progress:2,lineWidth:5.0,fillColor: UIColor.clearColor())
            CircleView.drawCircleOn(backgroundCicularview, color: UIColor(hexString:"29ABA9"), progress:totalProgress*2,lineWidth:5.0,fillColor: UIColor.clearColor())

            iconImageView.frame = CGRect(x: (frame.size.width-frame.size.height)/2+32, y: 20, width: frame.size.height-65, height: frame.size.height-65)
        }
    }
    func loadWithDataSource(card : Card) {
        self.card = card
        self.iconImageView.image = nil
        self.globalPointLabel.text = "\(ActivitiesController.getGlobalPoint(card)) global points"
        self.weeklyPointLabel.text = "\(ActivitiesController.getWeeklyPoint(card)) points this week"
        ImageLoader.sharedLoader.imageForUrl((card.shop?.logo)!) { (image, url) in
            dispatch_async(dispatch_get_main_queue(), {
                self.iconImageView.image = image
                UtilityManager.drawCircularImage(self.iconImageView)
            });
        }
    }
}
