import 'package:flutter/material.dart';
class Coin{
  String price;
  String percentage;
  String coinRealTimePrice;
  // void setVal(){
  //   setState(() {
  //
  //   });
  // }
  Coin(this.price,this.percentage,this.coinRealTimePrice);
}
Coin bit=Coin("0","0","0");
Coin eth=Coin("0","0","0");
class NewCoin extends StatefulWidget {
  // final List<Widget>showWidgets;
  final ValueChanged<int>del;
  final String str;
  final String realTimePrice;
  NewCoin({Key key,this.del,this.str,this.realTimePrice}) : super(key: key);
  @override
  _NewCoinState createState() => _NewCoinState();
}

class _NewCoinState extends State<NewCoin> {
  String a="";
  String _value="Price";
  // String clRealTimePrice;
  final myController=TextEditingController();
  @override
  void dispose(){
    myController.dispose();
    super.dispose();
  }
  String ini="";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: InkWell(
        child: Ink(
          child: Container(
            width:MediaQuery.of(context).size.width*0.95,
            height: 119.0,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50,  0, 40,  0),
                    child: Text(
                        widget.str,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.fromLTRB( 10,  0, 40, 0),
                  //   child: IconButton(
                  //     iconSize: 30,
                  //       icon: Icon(Icons.delete), onPressed:(){
                  //       setState(() {
                  //         String str1=widget.key.toString();
                  //         str1=str1.substring(2,str1.length-2);
                  //         widget.del(int.parse(str1));
                  //       });
                  //   }
                  //       ),
                  // )
                ],
              ),
            decoration: BoxDecoration(
              color: Color.fromRGBO(250,241,230, 100),
              border: Border.all(
                color: Colors.red,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          ),
        ),
        onTap:() {
          return showDialog<void>(
            context:context,
            builder:(BuildContext context){
              return AlertDialog(
                content:Text("Select increase in price or increase in percentage."),
                actions:<Widget>[
                  Column(
                    children:[
                      Row(
                        children:[
                          Text("Price"),
                          Radio(
                          value:"Price",
                          groupValue:_value,
                          onChanged:(String value){
                            setState(() {
                              _value=value;
                              print(_value);
                            });
                          },
                        ),

                        ]
                      ),
                      Row(
                        children:[
                          Text("Percentage"),
                          Radio(
                            value:"Percentage",
                            groupValue:_value,
                            onChanged:(String value){
                              setState(() {
                                _value=value;
                                print(_value);
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  TextField(
                    controller:myController,
                    // obscureText: true,
                    // controller:TextEditingController()..text=ini,
                    decoration: InputDecoration(
                      border:OutlineInputBorder(),
                      labelText: '% or \$',
                      errorText:(this.a=="")?"enter a no":null
                    ),
                    keyboardType:TextInputType.number,
                    onChanged:(String str){
                      print(str);
                      setState(() {
                        a=str;
                      });
                    },
                  ),
                  TextButton(
                    child:Text("ok"),
                    onPressed: (){
                      // clRealTimePrice=widget.realTimePrice;
                      // print(clRealTimePrice);
                      if(_value=="Price" && widget.key==Key("1"))
                      {
                        bit.price=a;
                        bit.percentage="0";
                        bit.coinRealTimePrice=widget.realTimePrice;
                      }
                      else if(_value=="Price" && widget.key==Key("2"))
                      {
                        eth.price=a;
                        eth.percentage="0";
                        eth.coinRealTimePrice=widget.realTimePrice;
                      }
                      else if(_value=="Percentage" && widget.key==Key("1"))
                      {
                        bit.percentage=a;
                        bit.price="0";
                        bit.coinRealTimePrice=widget.realTimePrice;
                      }
                      else if(_value=="Percentage" && widget.key==Key("2"))
                      {
                       eth.percentage=a;
                       eth.price="0";
                       eth.coinRealTimePrice=widget.realTimePrice;
                      }
                      // setState(() {

                      // });
                      // print(bit.price);
                      // print("hi");
                      // print(eth.price);
                      // print("hi");
                      // print(bit.percentage);
                      // print("hi");
                      // print(eth.percentage);
                      // print("hi");
                      // print(bit.coinRealTimePrice);
                      // print("hi");
                      // print(eth.coinRealTimePrice);
                      // print("hi");
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            },
          );
          // void selectRadio(int value) {
          //   setState((){
          //     groupValue=value;
          //   });
          // };
          // print("hi");
          // return showDialog(
          //   context:context,
          //   builder:(context)=>AlertDialog(
          //     title: Text("title"),
          //     actions:<Widget>[
          //       Radio(value:0,groupValue:groupValue,onChanged:selectRadio(0)),
          //       Radio(value:1,groupValue:groupValue,onChanged:selectRadio(1))
          //     ],
          //   )
          // );
        },
      ),
    );
  }
}
