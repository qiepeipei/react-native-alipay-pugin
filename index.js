/**
 * Created by qiepeipei on 16/7/21.
 */
'use strict';
import React, {
    DeviceEventEmitter,
    NativeModules,
    Platform,

} from 'react-native';
var alipay = NativeModules.Alipay;
class Alipay {
    
    constructor (config) {

        if(typeof config.partner === 'undefined'){
            throw 'partner不能为空!';
        }

        if(typeof config.seller === 'undefined'){
            throw 'seller不能为空!';
        }

        if(typeof config.privateKey === 'undefined'){
            throw 'privateKey不能为空!';
        }


        if(config.partner.length <= 0){

            throw 'partner不能为空字符串!';
        }

        if(config.seller.length <= 0){

            throw 'seller不能为空字符串!';
        }

        if(config.privateKey.length <= 0){

            throw 'privateKey不能为空字符串!';
        }

        // 初始化socket对象
        alipay.initialise(config);

    }

    pay(orderMap,callBack){

        if(orderMap.productName.length <= 0){

            throw '订单名称不能为空';
        }

        if(orderMap.productDescription.length <= 0){

            throw '订单描述不能为空';
        }

        if(orderMap.amount < 0.01){

            throw '订单金额必须大于0.01';
        }else{
            orderMap.amount = String(orderMap.amount)
        }

        if(orderMap.orderID.length <= 0){

            throw '订单编号不能为空';
        }

        if(orderMap.notifyURL == null){

            orderMap.notifyURL = "www.baidu.com";
        }

        if(orderMap.notifyURL.length <= 0){

            orderMap.notifyURL = "www.baidu.com";
        }

        alipay.pay(orderMap,callBack)

    }



}

module.exports = Alipay;
