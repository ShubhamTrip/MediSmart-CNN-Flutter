import 'package:flutter/material.dart';
class OutputCard extends StatelessWidget {
  const OutputCard({required this.headText,required this.height,required this.width,
    required this.headerSize,required this.valueText,required this.valueSize,required this.headerColor,required this.valueColor});
  final double height;
  final double width;
  final Color headerColor,valueColor;
  final String headText;
  final double headerSize,valueSize;
  final String valueText;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10,bottom: 20),
      height: height,width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(headText,style: TextStyle(fontSize: headerSize,fontWeight: FontWeight.w700,color: headerColor),),
          Text(valueText,style: TextStyle(fontWeight: FontWeight.w700,fontSize: valueSize,color: valueColor),)
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[900],
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ]
      ),

    );
  }
}
