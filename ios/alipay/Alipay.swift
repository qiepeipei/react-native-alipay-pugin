//
//  Alipay.swift
//  rn001
//
//  Created by qiepeipei on 16/7/21.
//  Copyright © 2016年 Facebook. All rights reserved.
//

import Foundation
@objc(Alipay)
class Alipay: NSObject {

  var bridge: RCTBridge!  //通信对象
  
  @objc func initWithBridge(_bridge: RCTBridge) {
    self.bridge = _bridge
  }
  
  func initialise(config:Dictionary<String,String>){
    
    AlipayConfig.partner = config["partner"]!
    AlipayConfig.seller = config["seller"]!
    AlipayConfig.privateKey = config["privateKey"]!

  }
  
  func pay(orderMap:Dictionary<String,String>,callback: (NSObject) -> ()){
    
    
  
    let Orders = Order()
    
    Orders.partner = AlipayConfig.partner
    Orders.seller = AlipayConfig.seller
    Orders.productName = orderMap["productName"]
    Orders.productDescription = orderMap["productDescription"]
    Orders.amount = NSString(format: "%.2f",Double(orderMap["amount"]!)!) as String ;//（价格必须小数点两位）
    Orders.tradeNO = orderMap["orderID"]
    Orders.notifyURL = orderMap["notifyURL"];//服务器通知url
    Orders.service = "mobile.securitypay.pay"
    Orders.paymentType = "1"
    Orders.inputCharset = "utf-8"
    Orders.itBPay = "30m"
    Orders.showUrl = "m.alipay.com"
    
    
    //应用注册scheme,在AlixPayDemo-Info.plist定义URL types,用于快捷支付成功后重新唤起商户应用
    let appScheme = "AlipayDemo"
    let orderSpec = Orders.description;
    let signer = CreateRSADataSigner(AlipayConfig.privateKey);
    let signedString = signer.signString(orderSpec);
    let orderString = "\(orderSpec)&sign=\"\(signedString)\"&sign_type=\"RSA\"";
    AlipaySDK.defaultService().payOrder(orderString, fromScheme: appScheme, callback: { (resultDic) -> Void in
      if let Alipayjson = resultDic as? NSDictionary{
         callback([Alipayjson])
      }
    })
  }



  
  
  
  
}
