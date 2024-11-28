import 'package:flutter/material.dart';
import 'package:flutter_application_1/Task6_BMI/widgets/const.dart';

class ResultPage extends StatelessWidget {
  final double bmiResult;

  ResultPage({required this.bmiResult});

  @override
  Widget build(BuildContext context) {
    String category;
    String resultMessage;
    Color resultColor;

    if (bmiResult < 18.5) {
      category = 'Underweight';
      resultMessage = 'Consider gaining weight.';
      resultColor = ConstColor.warningColor;
    } else if (bmiResult >= 18.5 && bmiResult <=25) {
      category = 'Normal weight';
      resultMessage = 'Excellent!';
      resultColor = ConstColor.successColor;
    } else {
      category = 'Overweight';
      resultMessage = 'Consider losing weight.';
      resultColor = ConstColor.warningColor;
    }

    return Scaffold(
      backgroundColor: ConstColor.primaryBgColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: ()=>{
                  Navigator.pop(context),

          },
         icon: Icon(Icons.arrow_back_ios_new_rounded , color: Colors.white,)),
        backgroundColor: ConstColor.primaryBgColor,
        title: Text('BMI Result', 
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: ConstColor.secondaryBgColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  padding: EdgeInsets.all(30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     
                      Text(
                        'Your BMI Result ',
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                       Text(
                        '${bmiResult.toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold, color: resultColor),
                        textAlign: TextAlign.center,
                      ),
                                      SizedBox(height: 10),
            
                         Text(
                        category,
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      Text(
                        resultMessage,
                        style: TextStyle(fontSize: 22, color: resultColor, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 40),
            
              
                    ],
                  ),
                ),
              ),
            ),
        
                      SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context); 
                      },
                      child: Text('Re-Calculate', style: TextStyle(color: Colors.white, fontSize: 20)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ConstColor.btnBgColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        padding: EdgeInsets.all(10.0),
                      ),
                    ),
                  ),
                    ],
        ),
      ),
    );
  }
}
