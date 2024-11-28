import 'package:flutter/material.dart';
import 'package:flutter_application_1/Task6_BMI/widgets/const.dart';

class age extends StatefulWidget {
  const age({
    super.key,

  });

  @override
  State<age> createState() => _ageState();
}
class _ageState extends State<age> {
      double value=30;
double? EnteredValue;
  @override
  Widget build(BuildContext context) {
    return Expanded(

      child: Container(
          decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: ConstColor.secondaryBgColor,
              ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Age', style: TextStyle(color: Colors.white,fontSize:21),),
                         SizedBox(height: 2,),

            Text(value.toString(), style: TextStyle(color: Colors.white,fontSize:21),),
             SizedBox(height: 8,),
          Row(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: const Color.fromARGB(255, 54, 55, 77),
              ),
              child: IconButton(
              onPressed: (){
                setState(() {
                  value++;
                  print(value);
                });
              }, 
              icon: Icon(Icons.add , color: Colors.white,)
              ),
            ),
            SizedBox(width: 10,),
              Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: const Color.fromARGB(255, 54, 55, 77),
              ),
              child: IconButton(
              onPressed: (){
                setState(() {
                  value--;
                });
              }, 
              icon: Icon(Icons.remove , color: Colors.white,)
              ),
            ),
          ],
          )
        
          ],
        ),
      ),
    );
  }
}

