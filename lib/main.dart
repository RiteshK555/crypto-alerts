import 'package:crypto_alerts/newcoin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:web_socket_channel/io.dart';
import 'package:websocket_manager/websocket_manager.dart';
// import 'package:web_socket_channel/status.dart' as status;
import 'package:http/http.dart' as http;
import 'empty.dart';
final channel=WebSocketChannel.connect(Uri.parse('wss://ws.coincap.io/prices?assets=bitcoin,ethereum'));

void main() async{
  // List currencies = await getCurrencies();
  // print(currencies)
  runApp(MyApp());
}
class MyApp extends StatefulWidget {

  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FlutterLocalNotificationsPlugin fltrNotification;
  @override
  void initState(){
    super.initState();
    var androidInitialize=new AndroidInitializationSettings('white');
    var ioSinitialize=new IOSInitializationSettings();
    var initializationSettings=new InitializationSettings(android:androidInitialize,iOS:ioSinitialize);
    fltrNotification=new FlutterLocalNotificationsPlugin();
    fltrNotification.initialize(initializationSettings,onSelectNotification: notificationSelected );
  }
  // final channel=WebSocketChannel.connect(
  //   Uri.parse('wss://stream.cryptowat.ch/connect?apikey=5RWE3KO2I4WUIRS70T3U'),
  // );
  String bitcoin="30000";
  String ethereum="2000";
  List<Widget>_ini=[];
  Map<int,Widget>_showWidgets={};
  var _count=0;
  void _del(int key)
  {
    setState((){
     // _showWidgets=_showWidgets.sublist(0,key)+_showWidgets.sublist(key+1,_showWidgets.length);
      _showWidgets.remove(key);
      // _count=_showWidgets.length;
    });
  }
  _showNotificationfun(String str,String str1,String str2)async{
var androidDetails=new AndroidNotificationDetails("Channel ID","New","description",importance:Importance.max);
var iOSDetails=new IOSNotificationDetails();
var generalNotificationDetails=new NotificationDetails(android:androidDetails,iOS:iOSDetails);
await fltrNotification.show(0,"Crypto Alert","$str "+((double.parse(str1)>0)?"increased":"decreased")+" by $str1 $str2",generalNotificationDetails);
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream:channel.stream,
      builder:(context,snapshot){
        // fun()async{
        //   Map m=await jsonDecode(snapshot.data);
        //   print(m);
        //   print(m["bitcoin"]);
        //   print(m["ethereum"]);
        // };
        fun1()async{
          Map m=await jsonDecode(snapshot.data);
          setState(() {
            if(m.containsKey("bitcoin"))
              {
                bitcoin=m["bitcoin"];
                if(double.parse(bit.price)>0 &&(double.parse(bit.price)<=(double.parse(m["bitcoin"])-double.parse(bit.coinRealTimePrice))))
                  {
                    _showNotificationfun("bitcoin",bit.price,"price");
                    print("bitcoin price increased");
                    print(bit.price);
                    print(m["bitcoin"]);
                    print(bit.coinRealTimePrice);
                  }
                if(double.parse(bit.percentage)>0 &&((double.parse(bit.percentage)*(double.parse(bit.coinRealTimePrice)))<=(100*(double.parse(m["bitcoin"])-double.parse(bit.coinRealTimePrice)))))
                {
                  _showNotificationfun("bitcoin",bit.percentage,"percentage");
                  print("bitcoin percentage increased");
                }
                if(double.parse(bit.price)<0 &&(double.parse(bit.price)>=(double.parse(m["bitcoin"])-double.parse(bit.coinRealTimePrice))))
                {
                  _showNotificationfun("bitcoin",bit.price,"price");
                  print("bitcoin price decresaed");
                  print(bit.price);
                  print(m["bitcoin"]);
                  print(bit.coinRealTimePrice);
                }
                if(double.parse(bit.percentage)<0 &&((double.parse(bit.percentage)*(double.parse(bit.coinRealTimePrice)))>=(100*(double.parse(m["bitcoin"])-double.parse(bit.coinRealTimePrice)))))
                {
                  _showNotificationfun("bitcoin",bit.percentage,"percentage");
                  print("bitcoin percentage decreased");
                }
              }
            if(m.containsKey("ethereum"))
              {
                ethereum=m["ethereum"];
                if(double.parse(eth.price)>0 &&(double.parse(eth.price)<=(double.parse(m["ethereum"])-double.parse(eth.coinRealTimePrice))))
                {
                  _showNotificationfun("ethereum",eth.price,"price");
                  print("ethereum price increased");
                }
                if(double.parse(eth.percentage)>0 &&((double.parse(eth.percentage)*(double.parse(eth.coinRealTimePrice)))<=(100*(double.parse(m["ethereum"])-double.parse(eth.coinRealTimePrice)))))
                {
                  _showNotificationfun("ethereum",eth.percentage,"percentage");
                  print("ethereum percentage increased");
                }
                if(double.parse(eth.price)<0 &&(double.parse(eth.price)>=(double.parse(m["ethereum"])-double.parse(eth.coinRealTimePrice))))
                {
                  _showNotificationfun("ethereum",eth.price,"price");
                  print("ethereum price decreased");
                }
                if(double.parse(eth.percentage)<0 &&((double.parse(eth.percentage)*(double.parse(eth.coinRealTimePrice)))>=(100*(double.parse(m["ethereum"])-double.parse(eth.coinRealTimePrice)))))
                {
                  _showNotificationfun("ethereum",eth.percentage,"percentage");
                  print("ethereum percentage decreased");
                }
              }
          });
        };
        fun1();
        // String textData;
        // for (int i=0;i<m.length;i++)
        //   {
        //     if(m[i].key=="bitcoin")
        //       {
        //         textData=m[i].value;
        //       }
        //
        //   }
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text("Crypto Alerts"),
            ),
            body:SafeArea(
              // child:(_showWidgets.length==0)?(Empty()):ListView(
              //   children: _showWidgets.values.toList(),
              // ),
              // child:Text(bitcoin),
              child:ListView(
                children:<Widget>[
                  NewCoin(key:ValueKey("1"),del:_del,str:"Bitcoin"+":"+bitcoin+"\$",realTimePrice:bitcoin),
                  NewCoin(key:ValueKey("2"),del:_del,str:"Ethereum"+":"+ethereum+"\$",realTimePrice:ethereum)
                ],
              ),
              // child:Text((jsonDecode(snapshot.data)).values()),
            ),
            // floatingActionButton: FloatingActionButton(
            //   child: Icon(Icons.add),
            //   onPressed:(){
            //     _showNotificationfun();
            //
            //   },
            // ),
          ),
        );
      },

    );
  }
  Future notificationSelected(String payload)async{

  }
}
