# react-native-alipay-pugin
react native支付宝插件


### 使用实例

	var Alipay = require('react-native-alipay-pugin');

    var alipay = new Alipay(
        {   //商户PID
          partner: "商户PID",
          // 商户收款账号
          seller: "商户收款账号",
          // 商户私钥，pkcs8格式
          privateKey: ""
        }
    );


    alipay.pay({
            productName: "买菜",     //订单名称
            productDescription: "买2斤", //订单描述
            amount: 0.01,   //支付金额
            orderID: "ID998989893232",  //订单id
            notifyURL: null  //通知回调地址
        }, (str)=> {

            if(str.indexOf("9000")>0){

                console.log("支付成功");

            }else if(str.indexOf("8000")>0){

                console.log("正在处理中");

            }else if(str.indexOf("4000")>0){

                console.log("订单支付失败");

            }else if(str.indexOf("6001")>0){

                console.log("用户中途取消");

            }else if(str.indexOf("6002")>0){

                console.log("网络连接出错");

            }


      });

      
	


## npm install react-native-alipay-pugin

####android配置
1. 设置 `android/setting.gradle` 注意: 如果node_modules前面有空格记得删除,不然无法读取lib

    ```
    ...
	include ':aliplay'
	project(':aliplay').projectDir = new File(rootProject.projectDir, '../	node_modules/react-native-alipay-pugin/android/aliplay')

	
    ```

2. 设置 `android/app/build.gradle`

    ```
    ...
    dependencies {
        ...
        compile project(':aliplay')
    }
    ```
    
3. 注册模块 (到 MainApplication.java)

    ```
    import com.example.aliplay.AlipayPackage;  // <--- 导入

    public class MainApplication extends Application implements ReactApplication {
      ......

        @Override
    	protected List<ReactPackage> getPackages() {
      		return Arrays.<ReactPackage>asList(
          			new MainReactPackage(),
          			new AlipayPackage()      //<--- 添加
      		);
    	} 

      ......

    }
    ```

###ios配置
####打开该目录 .../node_modules/react-native-alipay-pugin/ios/AlipaySDK

![Mou icon1](/assets/a1.png)

![Mou icon1](/assets/a2.png)

```
../node_modules/react-native-alipay-pugin/ios/alipay/Alipay-Bridging-Header.h

```

![Mou icon1](/assets/a3.png)

![Mou icon1](/assets/a4.png)

```
  <key>CFBundleURLTypes</key>
  <array>
    <dict>
      <key>CFBundleTypeRole</key>
      <string>Editor</string>
      <key>CFBundleURLName</key>
      <string></string>
      <key>CFBundleURLSchemes</key>
      <array>
        <string>AlipayDemo</string>
      </array>
    </dict>
  </array>
	

```

![Mou icon1](/assets/a5.png)





