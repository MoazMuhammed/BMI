import 'dart:math';

import 'package:bmi/bmiresult.dart';
import 'package:bmi/call.dart';
import 'package:bmi/colors.dart';
import 'package:flutter/material.dart';

class BMIFirstScreen extends StatefulWidget {
  const BMIFirstScreen({Key? key}) : super(key: key);

  @override
  State<BMIFirstScreen> createState() => _BMIFirstScreenState();
}

class _BMIFirstScreenState extends State<BMIFirstScreen> {
  @override
  void initState() {}

  bool male = true;
  double height = 170;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        title: const Text("BMI"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          buildMAleFamelItems(),
          buildHightState(),
          buildAgeItem(),
          buildButtomItem()
        ],
      ),
    );
  }

  Widget buildMAleFamelItems() {
    return Expanded(
      child: Row(
        children: [
          Expanded(
              child: InkWell(
                  onTap: () {
                    male = true;
                    setState(() {});
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: male ? selectedColor : secondColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.male,
                          size: 66,
                          color: Colors.white,
                        ),
                        Text(
                          "Male",
                          style: TextStyle(fontSize: 22, color: Colors.grey),
                        )
                      ],
                    ),
                  ))),
          Expanded(
              child: InkWell(
            onTap: () {
              male = false;
              setState(() {});
            },
            child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: male ? secondColor : selectedColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.female,
                    size: 66,
                    color: Colors.white,
                  ),
                  Text(
                    "Female",
                    style: TextStyle(fontSize: 22, color: Colors.grey),
                  )
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }

  Widget buildHightState() {
    return Expanded(
        child: Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: secondColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Hight",
            style: TextStyle(
              fontSize: 22,
              color: Colors.grey,
            ),
          ),
          Text('${height.toInt()}cm',
              style: const TextStyle(
                fontSize: 44,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),
          Slider(
              min: 0,
              max: 220,
              value: height,
              activeColor: pinkColor,
              inactiveColor: Colors.grey,
              onChanged: (double value) {
                height = value;
                setState(() {});
              })
        ],
      ),
    ));
  }

  Widget buildAgeItem() {
    return Expanded(
        child: Row(children: [
      Expanded(
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: secondColor, borderRadius: BorderRadius.circular(15)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'weight',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.grey,
                ),
              ),
              Text(
                '${weight.toString()}',
                style: TextStyle(
                  fontSize: 44,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: IconButton(
                      onPressed: () {
                        weight++;
                        setState(() {});
                      },
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: IconButton(
                      onPressed: () {
                        weight--;
                        setState(() {});
                      },
                      icon: Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      Expanded(
          child: Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: secondColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Age',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      "${age.toInt()}",
                      style: const TextStyle(
                          fontSize: 44,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey,
                            child: IconButton(
                              onPressed: () {
                                if (age == 1) return;
                                age--;
                                setState(() {});
                              },
                              icon: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.grey,
                            child: IconButton(
                              onPressed: () {
                                age++;
                                setState(() {});
                              },
                              icon: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ])
                  ])))
    ]));
  }

  Widget buildButtomItem(){
   return InkWell(
       onTap: () {
         double result = weight / pow(height / 100, 2);
         print(result);
        Navigator.push(
       context,
       MaterialPageRoute(builder: (context) => BmiResultScreen(result:  result,height: height,weight: weight,age:  age),),
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
