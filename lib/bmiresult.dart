import 'package:bmi/bmi.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class BmiResultScreen extends StatefulWidget {
  BmiResultScreen({Key? key, required this.result, required this.height, required this.weight, required this.age,}) : super(key: key);
  final double result;
  final double height;
  final int weight;
  final int age;

  @override
  State<BmiResultScreen> createState() => _BmiResultScreenState();
}

class _BmiResultScreenState extends State<BmiResultScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: mainColor,
      body: Column(
        children: [
          Text(
            "Your Result",
            style: TextStyle(
                fontSize: 44, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: secondColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Text("Nomal",style: TextStyle(color: Colors.pink,fontSize: 50,fontWeight: FontWeight.bold),),
                  Text("Result: ${widget.result}",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w500),),
                  Text("Height: ${widget.height}",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w500),),
                  Text("Weight: ${widget.weight}",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w500),),
                  Text("Age: ${widget.age}",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w500),),
              ],
              ),
            ),

          ),     buildButtomItem(),
        ],
      ),
        ));

  }
  Widget buildButtomItem(){
    return InkWell(
      onTap: () {
        Navigator.pop(
          context,
          MaterialPageRoute(builder: (context) => BMIFirstScreen(),),
        );
      },
      child: Container(
          color: Colors.pink,
          padding: EdgeInsets.all(10),
          width: double.infinity,
          alignment: AlignmentDirectional.center,
          child: Text(
            "Calculate",style: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold),
          )),
    );
  }
}
