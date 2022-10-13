import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:majorold/Desease.dart';

class Instructions extends StatelessWidget {
  const Instructions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.lightBlueAccent[900], toolbarHeight: 0,),
      backgroundColor: Colors.lightBlueAccent,
      bottomNavigationBar: Container(
        height: 30,
        color: Colors.black,
        child: Center(child: Text("Developed by Shubham Tripathi | Ankur Nagila | Dhaval Pandey BTKIT Dwarahat",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white,fontSize: 12,),),),
      ),
      body: Stack(
        children: [
          Container(
            alignment: Alignment.bottomLeft,
            child: SvgPicture.asset('assets/CovidAnimate.svg',height: 180,width: 180,),

          ),
          Center(

            child: ListView(

              children:[
                SizedBox(height: 40),
                Column(
                  children: [
                    Text("INSTRUCTIONS",style: TextStyle(color: Colors.blue[900],fontSize: 20,fontWeight: FontWeight.w700
                    ),),
                    SizedBox(height: 50,),
                    Text("1.Go to the Detector Section of the app.",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600
                    ),),
                    SizedBox(height: 20,),
                    Text("2.Feed the X Ray you want to analyse",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600
                    ),),
                    SizedBox(height: 5,),
                    Text("Click picture of X ray or directly \n select from the gallary.",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400
                    ),),
                    SizedBox(height: 20,),
                    Text("3.Press on the Analyse button for output",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600
                    ),),
                    SizedBox(height: 150,),
                    GestureDetector(
                      onTap: () => Navigator.push(context, MaterialPageRoute(
                          builder: (context){return Desease();})),
                      child: Container(
                          width: MediaQuery.of(context).size.width - 160,
                          alignment: Alignment.center,
                          padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 17, ),
                          decoration: BoxDecoration(
                              color: Colors.blue[700],
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Text("Click Here", style: TextStyle(color: Colors.white, fontSize: 16))
                      ),
                    ),
                      
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
