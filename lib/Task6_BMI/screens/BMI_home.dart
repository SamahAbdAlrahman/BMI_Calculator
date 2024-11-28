import 'package:flutter/material.dart';
import 'package:flutter_application_1/Task6_BMI/widgets/ageWidget.dart';
import 'package:flutter_application_1/Task6_BMI/widgets/gender.dart';
import 'package:flutter_application_1/Task6_BMI/widgets/const.dart';
import 'package:flutter_application_1/Task6_BMI/screens/result.dart';

class BMI extends StatefulWidget {
  @override
  _BMIState createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  double currentHeight = 174.0;
  double weightValue =65;

 double calculateBMI() {
    double heightInMeters = currentHeight / 100;
    return weightValue / (heightInMeters * heightInMeters);
  }


  void updateWeight(String calc) {
    setState(() {
      if (calc=="increase") {
        weightValue++;
      } else if (calc=="decrease") 
       {
        weightValue--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColor.primaryBgColor,
      appBar: AppBar(
        backgroundColor: ConstColor.primaryBgColor,
        title: Text(
          'BMI Calculator',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            // Gender 
            gender(),

            // Height 
            heightSlider(),

            // Age & Weight
            ageWeight(),

            SizedBox(height: 5),

            // BMI btn
            calculateButton(),
            
          ],
        ),
      ),
    );
  }

  // Widget لإظهار شريط التمرير لاختيار الطول
  Widget heightSlider() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: ConstColor.secondaryBgColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Height', style: TextStyle(color: Colors.white, fontSize: 16)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  currentHeight.toStringAsFixed(1),
                  style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
                ),
                SizedBox(width: 5),
                Text('cm', style: TextStyle(color: Colors.white, fontSize: 15)),
              ],
            ),
            Slider(
              value: currentHeight,
              min: 120.0,
              max: 230.0,
              inactiveColor: ConstColor.secondaryTextColor,
              activeColor: ConstColor.btnBgColor,
              onChanged: (value) {
                setState(() {
                  currentHeight = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget ageWeight() {
    return Expanded(
      child: Row(
        children: [
          age(),
          SizedBox(width: 15),
          weight(),
        ],
      ),
    );
  }

Widget weight() {
  return Expanded(
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: ConstColor.secondaryBgColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Weight', style: TextStyle(color: Colors.white, fontSize: 21)),
          SizedBox(height: 2),
          Text(weightValue.toString(), style: TextStyle(color: Colors.white, fontSize: 21)),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: const Color.fromARGB(255, 54, 55, 77),
                ),
                child: IconButton(
                  onPressed: () => updateWeight("decrease"),
                  icon: Icon(Icons.remove, color: Colors.white),
                ),
              ),
              SizedBox(width: 20), 
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: const Color.fromARGB(255, 54, 55, 77),
                ),
                child: IconButton(
                  onPressed: () => updateWeight("increase"), 
                  icon: Icon(Icons.add, color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

 
  Widget calculateButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          double bmiRes = calculateBMI();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultPage(bmiResult: bmiRes),
            ),
          );
        },
        child: Text('Calculate', style: TextStyle(color: Colors.white, fontSize: 20)),
        style: ElevatedButton.styleFrom(
          backgroundColor: ConstColor.btnBgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          padding: EdgeInsets.all(10.0),
        ),
      ),
    );
  }
}

