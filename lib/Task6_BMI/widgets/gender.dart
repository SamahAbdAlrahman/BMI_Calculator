import 'package:flutter/material.dart';
import 'package:flutter_application_1/Task6_BMI/widgets/const.dart';
class gender extends StatefulWidget {
  const gender({
    super.key,
  });

  @override
  State<gender> createState() => _genderState();
}

class _genderState extends State<gender> {
        bool isMale = true;

  @override
  Widget build(BuildContext context) {
    return  Expanded(
             child: 
                  Row(
                    children: [
Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isMale = true; 
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: isMale ? ConstColor.btnBgColor : ConstColor.secondaryBgColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.male, color: Colors.white, size: 70),
                    Text('Male', style: TextStyle(color: Colors.white, fontSize: 20)),
                  ],
                ),
              ),
            ),
          ),
                           SizedBox(width: 15,),
                          Expanded(

       child: GestureDetector(
        onTap: () {
          setState(() {
            isMale=false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            // color:  ConstColor.secondaryBgColor,
            color: (!isMale)
                ? ( ConstColor.btnBgColor) 
                : ConstColor.secondaryBgColor,
            borderRadius: BorderRadius.circular(15)
          ),
          child: Column(
                     mainAxisAlignment   : MainAxisAlignment.center,
          
            children: [
              Icon(Icons.female,
              color: Colors.white,size: 70,),
              Text('Female', style: TextStyle(color: Colors.white,fontSize: 20),),
          
            ],
          ),
        ),
      ),
    ),
                    ]
                 
              ),
          );

  }
}

