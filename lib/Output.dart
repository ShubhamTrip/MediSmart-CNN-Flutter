import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:majorold/OutputCard.dart';

class Output extends StatelessWidget {
  const Output({Key? key, required this.output}) : super(key: key);
  final List output;
  @override
  Widget build(BuildContext context) {
    var accuracy = output[0]["confidence"]*100;
    var res = output[0]["label"];
    res = res.substring(1);
    accuracy=accuracy.toStringAsFixed(2);
    return Scaffold(
      appBar:AppBar(backgroundColor: Colors.blueGrey[900], toolbarHeight: 45,),
      body: Stack(
        children: [
          Container(
            alignment: Alignment.bottomLeft,
            child: SvgPicture.asset('assets/CovidAnimate.svg',height: 200,width: 200,),

          ),
          Center(
          child: Column(
            children: [

              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[700],

                ),
                height: 40,
                width: 400,

                child: Center(
                  child: Text("TEST RESULTS", style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,),),
                ),
              ),
              SizedBox(height: 20,),
              OutputCard(headText: "RESULT", height: 150, width: MediaQuery.of(context).size.width - 20, headerSize: 24, valueText: "${res}",
                  valueSize: 20, headerColor: Colors.white, valueColor: Colors.grey)
              ,
              SizedBox(height: 20,),
              OutputCard(headText: "ACCURACY", height: 150, width: MediaQuery.of(context).size.width - 20, headerSize: 24, valueText: "${accuracy}%",
                  valueSize: 20, headerColor: Colors.white, valueColor: Colors.grey)
              ,
              ],
          ),
        ),

        ],
      ),
    );
  }
}
