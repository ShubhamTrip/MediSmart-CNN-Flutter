import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:majorold/MyCard.dart';
import 'package:majorold/Pneumonia.dart';
import 'package:majorold/Tuberculosis.dart';

import 'Covid.dart';

class Desease extends StatelessWidget {
  const Desease({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(backgroundColor: Colors.lightBlueAccent[900], toolbarHeight: 45,),
      body: Stack(
        children: [
          Container(
            alignment: Alignment.bottomLeft,
            child: SvgPicture.asset('assets/CovidAnimate.svg',height: 180,width: 180,),

          ),

          Center(
            child: Column(
              children: [
                SizedBox(height: 50,),
                MyCard(headText: "TUBERCULOSIS", height: 120, width: MediaQuery.of(context).size.width - 50, color: Colors.blueGrey,
                  headerSize: 20,  headerColor: Colors.white, img: 'assets/wp2.jpg', OnTap:(){
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context){return Tuberculosis();}));
                    }),
                SizedBox(height: 20,),
                MyCard(headText: "COVID 19", height: 120, width: MediaQuery.of(context).size.width - 50, color: Colors.blueGrey,
                  headerSize: 20,  headerColor: Colors.white, img: 'assets/wp3.jpg', OnTap: (){
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context){return Covid();}));
                    }),
                SizedBox(height: 20,),
                MyCard(headText: "PNEUMONIA", height: 120, width: MediaQuery.of(context).size.width - 50, color: Colors.blueGrey,
                  headerSize: 20,  headerColor: Colors.white, img: 'assets/wp2.jpg', OnTap: (){
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context){return Pneumonia();}));
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
