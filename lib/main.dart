import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
    
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: BmiCalculator(),
    );
  }
}
class BmiCalculator extends StatefulWidget {
 
  @override
  _BmiCalculatorState createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  double _weight = 50;
  double _heigt = 100;
  double _bmi = 0;
  String _message = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("BMI Calculator"), backgroundColor: Colors.red,),
    body:Container(
      padding: EdgeInsets.all(20),
      child: Column(children: <Widget>[
        Text("BMI Calculator",style: TextStyle(color: Colors.indigo, fontSize: 40),),
        SizedBox(height: 10,),
        Text("We care about your health", style: TextStyle(color: Colors.pink, fontSize: 20),),
        SizedBox(height: 10,),
        Image.network("https://www.anak2u.com.my/wp-content/uploads/2020/06/cropped-rsz_anak2ulogo.png"),
        // If you show variable you use $_height , but if you add operation ${_height.toStringAsFixed(2)}
        Text("Height  ${_heigt.toStringAsFixed(2)} : (cm)"),
        Slider(value: _heigt,
        min: 100,
        max:200,
        onChanged: (newValue){
          setState(() {
            _heigt=newValue;
          });
        },
        ),
        Text("Weight ${_weight.toStringAsFixed(2)} : (kg)"),
        Slider(value: _weight,
        min:20,
        max:150,
        onChanged: (newValue){
          setState(() {
            _weight=newValue;
          });
        },
        )
,FlatButton.icon(
  onPressed: (){

    setState(() {
      _bmi = _weight / pow((_heigt / 100),2) ;
      print(_bmi);
      if (_bmi < 18){
        _message = "You are underweight";
      }
      else if ( _bmi < 25){
        _message = "Normal BMI";
      }
      else if (_bmi < 30){
        _message = "You are overweight";
      }
      else {
        _message = "You are obese";
      }
    });

}, icon: Icon(Icons.account_circle), 
label: Text("Calculate"),),
Text("Your BMI is ${_bmi.toStringAsFixed(1)} $_message")
      ],)
    ));
  }
}
