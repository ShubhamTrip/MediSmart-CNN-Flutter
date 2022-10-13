import 'package:flutter/material.dart';
class MyCard extends StatelessWidget {
  const MyCard({required this.headText,required this.height,required this.width,required this.color,
    required this.headerSize, required this.headerColor, required this.OnTap, required this.img});
  final double height;
  final double width;
  final Color color,headerColor;
  final String headText;
  final double headerSize;
  final Function OnTap;
  final String img;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        OnTap();
      },
      child: Container(
        padding: EdgeInsets.only(top: 10,bottom: 20),
        height: height,width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(headText,style: TextStyle(fontSize: headerSize,fontWeight: FontWeight.w700,color: headerColor),),
          ],
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: color,
            image: DecorationImage(image: AssetImage(img),
            fit: BoxFit.cover),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 6.0,
              ),
            ]
        ),

      ),
    );
  }
}
